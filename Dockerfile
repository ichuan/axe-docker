FROM ubuntu:19.04
SHELL ["/bin/bash", "-c"]

RUN mkdir -p /opt/coin
WORKDIR /opt/coin

EXPOSE 9337

RUN apt-get update && apt-get install -y wget python
# RUN wget https://github.com/AXErunners/axe/releases/download/v1.5.0.1/axecore-1.5.0.1-x86_64-linux-gnu.tar.gz -O - | tar --strip-components 1 -C /opt/coin -xzf -
RUN wget https://talker.im/data/axecore-1.5.0.1-x86_64-linux-gnu.tar.gz -O - | tar --strip-components 1 -C /opt/coin -xzf -

# cleanup
RUN apt remove -y wget && apt autoremove -y && apt autoclean
RUN rm -rf /var/lib/apt/lists/* /opt/coin/bin/{axe-qt,test_axe,axe-tx}

VOLUME ["/opt/coin/data", "/opt/coin/coin.conf"]

ENTRYPOINT ["/opt/coin/bin/axed"]
CMD ["-conf=/opt/coin/coin.conf"]
