wget http://mirrors.viethosting.com/apache/hadoop/common/hadoop-2.9.2/hadoop-2.9.2.tar.gz
tar xzf  hadoop-2.9.2.tar.gz 
mv hadoop-2.9.2 ~/hadoop

sudo cat >> ~/.bashrc <<EOF
#export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
#export PATH=\$PATH:\$JAVA_HOME/bin:
export HADOOP_HOME=~/hadoop
export PATH=\$PATH:\$HADOOP_HOME/sbin:\$HADOOP_HOME/bin 
export HADOOP_CLASSPATH=\$JAVA_HOME/lib/tools.jar
EOF
source ~/.bashrc
