FROM ubuntu:18.10
RUN mkdir /code
WORKDIR /code
RUN apt update && apt install -y \
  python3-pip \
  libtool \
  autoconf-archive \
  pkg-config \
  libpng-dev \
  libjpeg8-dev \
  libtiff5-dev \
  zlib1g-dev \
  libicu-dev
COPY requirements.txt  /
RUN pip3 install -r /requirements.txt && rm /requirements.txt
#RUN wget https://github.com/tesseract-ocr/tesseract/archive/3.05.00.tar.gz &&\
#  tar -xf 3.05.00.tar.gz &&\
#  cd tesseract-3.05.00/ &&\
#  ./autogen.sh &&\
#  ./configure --enable-debug LDFLAGS="-L/usr/local/lib" CFLAGS="-I/usr/local/include" &&\
#  make && make install && ldconfig &&\
#  cd .. && rm -rf tesseract-3.05.00/
#RUN wget https://raw.githubusercontent.com/tesseract-ocr/tessdata/3.04.00/eng.traineddata && mv eng.traineddata /usr/local/share/tessdata/
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
CMD ["bash", "start.sh"]