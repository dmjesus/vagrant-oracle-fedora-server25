#!/bin/bash

sudo dnf update -y
sudo dnf install -y git vim curl glibc make binutils gcc libaio

sudo groupadd dba
sudo groupadd oinstall
sudo groupadd oper

# Create Oracle user #
sudo useradd -m -g dba -G oinstall,oper oracle

#Set password for Oracle #
sudo passwd oracle


sudo mkdir -p /u01/app/oracle
sudo chown -R oracle:dba /u01
sudo chmod -R 775 /u01/app

export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export ORACLE_SID=XE
export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`
export ORACLE_BASE=/u01/app/oracle
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
export PATH=$ORACLE_HOME/bin:$PATH

if [ -d /home/vagrant/gitViews ] && [ ! -e  "$MIG_ROOT_DIR" ] ; then

    echo "Setting necessary variables..."
    echo
    echo "export MIG_ROOT_DIR=/home/vagrant/gitViews/lhsj_main/bscs" >> /home/vagrant/.profile 
    echo "export MIG_WORK_DIR=/home/vagrant/gitViews/lhsj_main/bscs/work" >> /home/vagrant/.profile 
    echo "export PATH=$PATH:/home/vagrant/gitViews/lhsj_main/bscs/dmf/src/main/perl:/home/SYSADM/BSCS/bin" >> /home/vagrant/.profile 
    echo "export PERLLIB=/home/vagrant/gitViews/lhsj_main/bscs/dmf/src/main/perl" >> /home/vagrant/.profile 
    echo "export VIEW_ROOT=/home/vagrant/gitViews" >> /home/vagrant/.profile 
    echo "export DMF_ROOT_DIR=/home/vagrant/gitViews/lhsj_main/bscs/dmf" >> /home/vagrant/.profile 
    echo "export DMF_PERL_LIB_DIR=/home/vagrant/gitViews/lhsj_main/bscs/dmf/src/main/perl:/home/vagrant/gitViews/lhsj_main/bscs/dmf/src/main/perlExe" >> /home/vagrant/.profile 
    echo "export MIG_SETUP_DIR=/home/vagrant/gitViews/lhsj_main/bscs/database/share"
    echo "export DATA_SERVER_ADDRESS=T:oracle:3333" >> /home/vagrant/.profile 
    echo "export DATA_SERVER_WORKDIR=/home/vagrant/vagrant-ubuntu-oracle-xe/environment/BSCS/WORK" >> /home/vagrant/.profile 
fi