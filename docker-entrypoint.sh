#!/bin/bash

set -e

if [ "$1" = 'sentry' ]; then
	defaultConf='/home/user/.sentry/sentry.conf.py'
	linksConf='/home/user/docker-links.conf.py'
	
	if [ ! -s "$defaultConf" ]; then
		sentry init "$defaultConf"
	fi
	
	line="execfile('$linksConf')"
	if ! grep -q "$line" "$defaultConf"; then
		echo "$line" >> "$defaultConf"
	fi
	
	# TODO sentry upgrade?
	# it requires stdin to answer questions and dies on 'unexpected EOF'
	# but does not ask again when run a second time
fi

exec "$@"
