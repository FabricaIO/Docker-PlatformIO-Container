FROM busybox:latest

RUN mkdir -p /.platformio && \
    chmod 777 /.platformio

VOLUME ["/.platformio"]

CMD ["echo", "Volume container initialized."]

