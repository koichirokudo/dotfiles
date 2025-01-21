#!/usr/bin/env bash
set -ue

function whichdistro() {
	if [ -f /etc/debian_version ]; then
		echo debian
		return
	elif [ -f /etc/fedora-release ]; then
		echo redhat
		return
	elif [ -f /etc/redhat-release ]; then
		echo redhat
		return
	elif [ -f /etc/arch-release ]; then
		echo arch
		return
	elif [ -f /etc/alpine-release ]; then
		echo alpine
		return
	elif [ -f /etc/lsb-release ]; then
		echo ubuntu
		return
	fi
}

function password() {
  if ! ${password+:} false
    then
      echo "password: "
      read -s password
  fi
}

