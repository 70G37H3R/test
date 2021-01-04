mv spark-env.sh.template spark-env.sh
cat >> spark-env.sh <<EOF
export SPARK_MASTER_HOST=192.168.100.0
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
EOF
mv slaves.template slaves
cat >> slaves <<EOF
slave01
slave02
EOF
