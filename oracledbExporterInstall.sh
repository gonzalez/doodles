#!/bin/bash 

dnf -y  --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos
dnf -y distro-sync
dnf -y update

#install wget and go
dnf -y install wget go

#create oracle working directory
mkdir /opt/oracle
cd /opt/oracle

wget https://download.oracle.com/otn_software/linux/instantclient/215000/oracle-instantclient-basic-21.5.0.0.0-1.el8.x86_64.rpm
wget https://download.oracle.com/otn_software/linux/instantclient/215000/oracle-instantclient-sqlplus-21.5.0.0.0-1.el8.x86_64.rpm
wget https://download.oracle.com/otn_software/linux/instantclient/215000/oracle-instantclient-devel-21.5.0.0.0-1.el8.x86_64.rpm

#-rw-r--r-- 1 root root 55577628 Jan 24 10:42 oracle-instantclient-basic-21.5.0.0.0-1.el8.x86_64.rpm
#-rw-r--r-- 1 root root   674760 Jan 24 10:42 oracle-instantclient-devel-21.5.0.0.0-1.el8.x86_64.rpm
#-rw-r--r-- 1 root root   727404 Jan 24 10:42 oracle-instantclient-sqlplus-21.5.0.0.0-1.el8.x86_64.rpm

#install the oracle basic client & sqlplus & devel packages
dnf -y  install oracle-instantclient-*

#add the oci8 pkgconfig file
wget https://gist.githubusercontent.com/gonzalez/7950a170505c11055cb0290f010143ad/raw/1518fcc36a03ecc9f141467c7206ad4a043836b4/oci8.pc -P /usr/share/pkgconfig

#install the oracle exporter in /usr/local/bin
GOBIN=/usr/local/bin/ go install github.com/iamseth/oracledb_exporter@latest