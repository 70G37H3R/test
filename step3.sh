mv /opt/spark/conf/spark-env.sh.template /opt/spark/conf/spark-env.sh
cat >> /opt/spark/conf/spark-env.sh <<EOF
export SPARK_MASTER_HOST='change-ip-here'
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
EOF

mv /opt/spark/conf/slaves.template /opt/spark/conf/slaves
cat >> /opt/spark/conf/slaves <<EOF
slave01
slave02
slave03
EOF

mv /opt/spark/conf/spark-defaults.conf.template /opt/spark/conf/spark-defaults.conf
