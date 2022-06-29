FROM debian:bullseye

ARG UNAME=user
ARG UID=1000
ARG GID=985
ENV HOME /home/$UNAME/
#ENV PATH /home/$UNAME/.local/bin

RUN apt-get update
RUN apt-get install -y sudo

RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
RUN usermod -a -G sudo $UNAME
RUN echo "$UNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $UNAME
WORKDIR $HOME

RUN sudo apt-get update -y
RUN sudo apt-get install -y curl unzip openjdk-11-jdk gcc g++

#RUN mkdir /in && mkdir /out

RUN mkdir joern && cd joern && \
	curl -L "https://github.com/joernio/joern/releases/latest/download/joern-install.sh" -o joern-install.sh && \
	chmod u+x joern-install.sh && \
	sudo ./joern-install.sh --version=v1.1.898

COPY cpg.sh .
COPY cpgs.sh .
COPY export.sc .

CMD ./cpgs.sh /in /out
