sudo apt install python3-pip -y
sudo -H pip3 install --upgrade pip
sudo pip3 install elephas 
sudo pip3 install tensorflow==1.15.0
sudo pip3 install keras==2.2.4
sudo pip3 install flask==1.1.2
sudo pip3 install sklearn
sudo pip3 install gevent
sudo pip3 install opencv-python
#stop-all.sh
#start-all.sh
#Tat proxy
#spark-submit  --master spark://master:7077 --executor-memory 4g --driver-memory 10g --total-executor-cores 4 --conf "spark.rpc.message.maxSize=512" resnet_3_node.py 
