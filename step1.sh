sudo apt update -y 
sudo apt install openjdk-8-jdk scala -y
wget https://downloads.apache.org/spark/spark-3.0.1/spark-3.0.1-bin-hadoop3.2.tgz
tar xvf spark-3.0.1-bin-hadoop3.2.tgz
sudo mv spark-3.0.1-bin-hadoop3.2 /opt/spark

sudo cat >> ~/.bashrc <<EOF
export SPARK_HOME=/opt/spark
export PATH=$PATH:/opt/spark/bin:/opt/spark/sbin
export PYSPARK_PYTHON=/usr/bin/python3
EOF
source ~/.bashrc
mv /opt/spark/conf/spark-env.sh.template spark-env.sh
sudo cat >> /opt/spark/conf/spark-env.sh <<EOF
export SPARK_MASTER_HOST=<MASTER-IP>
export JAVA_HOME=</usr/lib/jvm/java-1.8.0-openjdk-amd64>
EOF
mv slaves.template slaves
sudo cat >> /opt/spark/conf/slaves <<EOF
slave01
slave02
EOF

