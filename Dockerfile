FROM ubuntu
LABEL version="version1" maintainer="devendra <davshakya@gmail.com>"
RUN apt-get update
RUN apt install -y python3
CMD python3