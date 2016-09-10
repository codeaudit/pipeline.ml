FROM fluxcapacitor/utils-ubuntu-14.04

ENV KUBERNETES_RELEASE=v1.3.6

RUN \
  wget https://storage.googleapis.com/kubernetes-release/release/$KUBERNETES_RELEASE/kubernetes.tar.gz 

RUN \
  tar -xzvf kubernetes.tar.gz \
  && rm kubernetes.tar.gz
  
#RUN \
#  sudo cp $KUBERNETES_HOME/platforms/linux/amd64/kubectl /usr/local/bin/kubectl \
#  && sudo chmod a+x /usr/local/bin/kubectl

COPY start.sh start.sh

CMD ["./start.sh"]

