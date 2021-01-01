sudo apt update -y
sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y containerd.io docker-ce docker-ce-cli
sudo mkdir -p /etc/systemd/system/docker.service.d

# Create daemon json config file
sudo tee /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF
#config proxy for docker
sudo tee /etc/systemd/system/docker.service.d/http-proxy.conf <<EOF
[Service]
Environment="http_proxy=http://proxy.ctu.edu.vn:3128"
Environment="https_proxy=http://proxy.ctu.edu.vn:3128"
Environment="ftp_proxy=http://proxy.ctu.edu.vn:3128"
Environment="no_proxy=localhost,127.0.0.1,192.168.100.16,192.168.0.{1..253},10.96.0.{1..253}"
Environment="HTTP_PROXY=http://proxy.ctu.edu.vn:3128"
Environment="HTTPS_PROXY=http://proxy.ctu.edu.vn:3128"
Environment="FTP_PROXY=http://proxy.ctu.edu.vn:3128"
Environment="NO_PROXY=localhost,127.0.0.1,192.168.100.16,192.168.0.{1..253},10.96.0.{1..253}"
EOF

#Start and enable Services
sudo systemctl daemon-reload 
sudo systemctl restart docker
sudo systemctl enable docker

apt update -y 
sudo apt install openjdk-8-jdk scala -y
wget https://downloads.apache.org/spark/spark-3.0.1/spark-3.0.1-bin-hadoop3.2.tgz
tar xvf spark-3.0.1-bin-hadoop3.2.tgz
sudo mv spark-3.0.1-bin-hadoop3.2 /opt/spark
nano ~/.bashrc
sudo cat >> /etc/docker/daemon.json <<EOF
export SPARK_HOME=/opt/spark
export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
export PYSPARK_PYTHON=/usr/bin/python3
EOF
source ~/.bashrc
