#!/usr/bin/env bash
# source this file to execute tasgrid after install
# also sets the python path
export PATH=$PATH:"C:/TASMANIAN-7.0"/bin/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"C:/TASMANIAN-7.0"/lib/
if [[ "OFF" == "ON" ]]; then
    export PYTHONPATH=$PYTHONPATH:""
fi

# export old and new style cmake search paths
export Tasmanian_DIR="C:/TASMANIAN-7.0"
export Tasmanian_ROOT="C:/TASMANIAN-7.0"
