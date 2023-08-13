#!/usr/bin/env bash

pushd $(dirname "${0}") > /dev/null

APPDIR=$(pwd -L)
VIRTUALENV=".venv"

# create virtual environment
virtualenv --system-site-packages $VIRTUALENV
source $VIRTUALENV/bin/activate
pip3 install -U pip
# install basic packages
pip3 install -r $APPDIR/requirements.txt
# install forked version of efb-wechat-slave
pip3 install --no-deps -e git+https://github.com/ehForwarderBot/efb-wechat-slave.git#egg=efb-wechat-slave
# install forked version of efb-patch-middleware
# pip3 install --no-deps -e git+https://github.com/HoganGolden/efb-patch-middleware-itchat-uos.git#egg=efb-patch-middleware-itchat-uos
# deactivate virtual environment
pip3 uninstall -y pip wheel
deactivate

popd > /dev/null

rm -rf /root/.cache /root/.local
