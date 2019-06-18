#!/bin/bash

# build ramdisk
ROOTDIR=/home/build

P1014ENV=${ROOTDIR}/ccenvs/ppc_p1014.env
MPC8315ENV=${ROOTDIR}/ccenvs/ppc_8315.env

SCMSVR=git@gitlabsvr.hlytec.com

BUILDDIR=${ROOTDIR}/nightly_build/ramdisk_build
if [ ! -d $BUILDDIR ]; then
	mkdir -p $BUILDDIR
fi

ERRORLOG=${BUILDDIR}/err_rd.log
if [ -f ${ERRORLOG} ]; then
	mv ${ERRORLOG} ${BUILDDIR}/err_rd_bak.log
fi

RAMDISKDIR=$BUILDDIR/ramdisk

cd $BUILDDIR
if [ -d $RAMDISKDIR ]; then
	rm -rf $RAMDISKDIR
fi
git clone $SCMSVR:/driver/os/ramdisk.git >> ${ERRORLOG}

cd $RAMDISKDIR

source $P1014ENV
sh mkrd.sh P1014CSB >> ${ERRORLOG}

source $MPC8315ENV
sh mkrd.sh MPC8315CSB >> ${ERRORLOG}

