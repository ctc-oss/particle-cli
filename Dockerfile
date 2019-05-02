FROM node:8

RUN apt update \
 && apt install -y libusb-1.0-0-dev

RUN npm install particle-cli

# -----------

FROM node:8-jessie-slim

RUN apt update \
 && apt install -y dfu-util libusb-1.0-0-dev \
 && rm -rf /var/lib/apt/lists

COPY --from=0 /node_modules /node_modules

RUN ln -s /node_modules/.bin/* /usr/local/bin

ENTRYPOINT particle
