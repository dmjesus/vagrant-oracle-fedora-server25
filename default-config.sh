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