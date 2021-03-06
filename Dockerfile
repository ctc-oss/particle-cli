FROM node:8

RUN apt update \
 && apt install -y libusb-1.0-0-dev

RUN npm config set user root \
 && npm install -g particle-cli@1.49.0

# -----------

FROM node:8-jessie-slim

RUN apt update \
 && apt install -y nano dfu-util libusb-1.0-0-dev \
 && rm -rf /var/lib/apt/lists \
 && npm config set user root

WORKDIR /root

ADD https://s3.amazonaws.com/spark-website/cloud_public.der .
COPY --from=0 /usr/local /usr/local

RUN ln -s /node_modules/.bin/* /usr/local/bin

ENTRYPOINT ["particle"]
CMD []
