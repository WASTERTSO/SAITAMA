FROM python:3.11.4-slim-buster


# Pypi package Repo upgrade
RUN apt-get install -y ffmpeg python3-pip curl
RUN apt update && apt upgrade -y && \
    apt install --no-install-recommends -y \
    libgl1 \
    bzip2 \
    unzip \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives /tmp

RUN apt install wget
RUN apt-get install ffmpeg -y
RUN apt-get install gifsicle -y

RUN pip3 install --upgrade pip setuptools
ENV PATH="/home/bot/bin:$PATH"

# make directory
RUN mkdir /SaitamaRobot/
COPY . /SaitamaRobot
WORKDIR /SaitamaRobot

# Install requirements
RUN pip3 install -U -r requirements.txt

# Starting Worker
CMD ["python3","-m","SaitamaRobot"]
