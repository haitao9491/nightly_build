#!/bin/bash

if [ -d /home/build/nightly_build/build_scripts ]; then
	rm -rf /home/build/nightly_build/build_scripts
fi
cd /home/build/nightly_build
git clone git@gitlabsvr.hlytec.com:/driver/build/build_scripts.git
cd build_scripts
./autobuild.sh 
