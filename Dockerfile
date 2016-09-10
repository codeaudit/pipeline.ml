FROM fluxcapacitor/utils-ubuntu-14.04

ENV KUBERNETES_RELEASE=v1.3.6
ENV FABRIC8_VERSION=0.4.58
ENV FABRIC8_OS=linux

WORKDIR /root

RUN \
  wget https://storage.googleapis.com/kubernetes-release/release/$KUBERNETES_RELEASE/kubernetes.tar.gz 

RUN \
  tar -xzvf kubernetes.tar.gz \
  && rm kubernetes.tar.gz

RUN \
  wget -O gofabric8 https://github.com/fabric8io/gofabric8/releases/download/v$FABRIC8_VERSION/gofabric8-$FABRIC8_OS-amd64 \ 
  && chmod a+x gofabric8

#RUN \
#  sudo cp $KUBERNETES_HOME/platforms/linux/amd64/kubectl /usr/local/bin/kubectl \
#  && sudo chmod a+x /usr/local/bin/kubectl

COPY start.sh start.sh

CMD ["./start.sh"]

