FROM ubuntu:latest
MAINTAINER Sunny Chan "chenri_shen@163.com"

ENV NAME=systemtap VERSION=0 RELEASE=1 ARCH=x86_64
LABEL com.redhat.component="$NAME" \
      name="$FGC/$NAME" \
      version="$VERSION" \
      release="$RELEASE.$DISTTAG" \
      architecture="$ARCH" \
      run="docker run  --privileged --rm  -v /sys/kernel/debug:/sys/kernel/debug -v /usr/src/:/usr/src/ -v   /lib/modules/:/lib/modules/ -v /usr/lib/debug:/usr/lib/debug -v /proc:/proc  -t -i --name  systemtap xfiretrace/systemtap:v0.0.1" \
      summary="programmable system-wide instrumentation system"

RUN sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list && apt update
RUN apt-get install git  -y
RUN apt-get build-dep systemtap -y
RUN git clone https://github.com/xfiretrace/systemtap.git
RUN cd systemtap && ./configure --prefix=/usr &&  make && make install
CMD ["/bin/bash"]
