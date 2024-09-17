#!/bin/sh

set -u # Treat unset variables as an error.

start_qlc() {
	/usr/bin/qlcplus -m -w -p
}
export QT_QPA_PLATFORM=offscreen
log_debug "starting QLC+..."
start_qlc

