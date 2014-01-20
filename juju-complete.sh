#!/bin/bash
# juju.autocomp: bash completion add-on for juju {ssh,set,get,status,upgrade-charm,...}
#
# Author: JuanJo Ciarlante <jjo@canonical.com>
# Copyright 2013+, Canonical Ltd.
# License: GPLv3


_juju_units_from_file() {
    python -c 'import json, sys;j=json.load(sys.stdin);print "\n".join(["  ".join(v.get("units",{}).keys()) for k,v in j["services"].items() if v.get("units", None)]);' < ${1?}
}
_juju_services_from_file() {
    python -c 'import json, sys;j=json.load(sys.stdin);print "\n".join(j["services"].keys());' < ${1?}
}
_juju_complete_cached() {
    local fun=${1?} add="$2"
    local cache_mins=60
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"
    local cache_dir=$HOME/.cache/juju
    local juju_cache_status=${cache_dir}/juju-status-${JUJU_ENV:-default}
    test -d ${cache_dir} || install -d $HOME/.cache ${cache_dir} -m 700
    if [[ -z $(find "${juju_cache_status}" -mmin -${cache_mins} -a -size +32c 2> /dev/null) ]]; then
        juju status --format=json > "${juju_cache_status}".tmp && \
            mv "${juju_cache_status}".tmp "${juju_cache_status}"
        rm -f "${juju_cache_status}".tmp
    fi
    [[ -r "${juju_cache_status}" ]] || return 0
    if [[ ${add} == add ]];then
        # Insert runtime completions at front
        COMPREPLY=( $( compgen -W "$(${fun} ${juju_cache_status})" -- ${cur} ) ${COMPREPLY[@]})
    else
        # Leave only runtime completions
        COMPREPLY=( $( compgen -W "$(${fun} ${juju_cache_status})" -- ${cur} ))
    fi
    return 0
}
_juju_cache_invalidate() {
    rm -fv $HOME/.cache/juju/juju-status-${JUJU_ENV?}
}
_juju_commands()
{
    local cur prev options files targets
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    actions=$(juju help commands 2>/dev/null | awk '{print $1}')
    COMPREPLY=( $( compgen -W "${actions}" -- ${cur} ) )
    return 0
}
_juju() {
    local prev pprev
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    # Static completion from juju commands
    _juju_commands "$@"
    # Try adding "runtime" completion
    case "${prev}" in
        ssh|scp|remove-unit|debug-hooks|resolved)
            _juju_complete_cached _juju_units_from_file
            return $?;;
        add-relation|remove-relation)
            _juju_complete_cached _juju_services_from_file
            return $?;;
        status|upgrade-charm|expose|unexpose|destroy-service|set|get|add-unit)
            _juju_complete_cached _juju_services_from_file
            return $?;;
    esac
    pprev="${COMP_WORDS[COMP_CWORD-2]}"
    case "${pprev}" in
        add-relation|remove-relation)
            _juju_complete_cached _juju_services_from_file
            return $?;;
    esac
}
complete -F _juju juju
# vim: ai et sw=2 ts=2
