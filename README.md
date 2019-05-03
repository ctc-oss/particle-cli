particle cli
===

on node:8-jessie-slim

### run

Mounting `/dev` with `--privileged` seems to give more reliable access to usb changes vs. using the `--device` specification.

```
#! docker run --rm -it --privileged -v /dev:/dev ctcoss/particle-cli identify

Your device id is 012345678909876543210
Your system firmware version is 1.0.1
```
