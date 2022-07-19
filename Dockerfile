FROM debian:bullseye

ARG UNAME=user
ARG UID=1000
ARG GID=985

RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
RUN usermod -a -G sudo $UNAME
RUN echo "$UNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN apt-get update -y
RUN apt-get install -y wget git openjdk-11-jdk gcc g++

# Setup sbt
RUN cd /opt/ && \
	wget https://github.com/sbt/sbt/releases/download/v1.7.1/sbt-1.7.1.tgz && \
	tar -zxzvf sbt-1.7.1.tgz && \
	rm sbt-1.7.1.tgz && \
	chown -R $UID:$GID .
ENV PATH="/opt/sbt/bin/:$PATH" 

# Setup joern
RUN cd /opt/ && \
	git clone https://github.com/MNayer/joern.git --depth=1 && \
	cd joern && \
	sbt stage && \
	chown -R $UID:$GID .
ENV PATH="/opt/joern/:$PATH"

ENV HOME /home/$UNAME/
USER $UNAME
WORKDIR $HOME

COPY cpg.sh .
#COPY cpgs.sh .
COPY export.sc .

CMD ./cpg.sh /in /out sources.jsonl
