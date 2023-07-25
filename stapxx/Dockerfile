FROM xfiretrace/systemtap:latest
RUN git clone https://github.com/xfiretrace/stapxx.git
RUN cd /stapxx && echo "export PATH=$PWD:$PATH" >> ~/.bashrc
CMD ["/bin/bash"]

