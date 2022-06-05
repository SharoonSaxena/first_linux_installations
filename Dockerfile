FROM ubuntu:focal
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
RUN apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev liblzma-dev install lzma
RUN wget -nv https://www.python.org/ftp/python/3.9.5/Python-3.9.5.tgz
RUN tar xzf Python-3.9.5.tgz
RUN cd Python-3.9.5 && ./configure --enable-optimizations && make -j8 && make install
RUN export PATH="$PATH:/usr/local/bin/python3.9"
RUN alias python3=/usr/local/bin/python3.9
RUN whereis python3
RUN python3 -m pip install --upgrade pip
RUN rm Python-3.9.5.tgz
RUN rm -rf Python-3.9.5

