mv /opt/spark/conf/spark-env.sh.template /opt/spark/conf/spark-env.sh
cat >> /opt/spark/conf/spark-env.sh <<EOF
export SPARK_MASTER_HOST=192.168.100.0
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
EOF
mv /opt/spark/conf/slaves.template /opt/spark/conf/slaves
cat >> /opt/spark/conf/slaves <<EOF
slave01
slave02
EOF
