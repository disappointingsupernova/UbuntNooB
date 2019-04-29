#!/bin/bash

function get_nord_status(){
nordvpn status
}

function list_nord_options(){
nordvpn settings list
}

function about_nord(){
echo "Current NordVPN status"
get_nord_status
echo ""
echo "NordVPN Settings"
list_nord_options
}

about_nord
