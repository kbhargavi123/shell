#!/bin/bash
rm *.tar
version=$1
ver=`echo $version | cut -d '.' -f1`
path=/home/vagrant/Aarnav/Tomcat
curl -o apache-tomcat-$version.tar http://www-eu.apache.org/dist/tomcat/tomcat-$ver/v$version/bin/apache-tomcat-$version.tar.gz 
scp apache-tomcat-$version.tar vagrant@192.168.56.101:$path
ssh vagrant@192.168.56.101 << EOF
if [ -d "$path/$version" ]
then
echo "directory exists"
else
echo "directory not exist"
mkdir $path/$version
fi
mv $path/apache-tomcat-$version.tar $path/$version
tar -C $path/$version -xvf $path/$version/apache-tomcat-$version.tar
exit
EOF
