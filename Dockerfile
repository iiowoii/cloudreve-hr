FROM debian:stable-slim

ADD conf.ini /root/cloudreve/conf.ini
# 付费版需要下载许可证，删除下方的#
#ADD key.bin /root/cloudreve/key.bin

RUN apt-get update \
    && apt-get install wget curl  -y

RUN wget -O install.sh http://download.bt.cn/install/install-ubuntu_6.0.sh
    
RUN bash install-ubuntu_6.0.sh

RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN unzip ngrok-stable-linux-amd64.zip
RUN cd ngrok-stable-linux-amd64
RUN ./ngrok http 8888
