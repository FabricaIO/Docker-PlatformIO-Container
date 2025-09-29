FROM python:3-slim

ENV APP_VERSION="6.1.18" \
    APP="platformio-core"

LABEL app.name="${APP}" \
      app.version="${APP_VERSION}" \
      maintainer="Sam Groveman <Groveman@fabrica-io.com>"

RUN pip install -U platformio==${APP_VERSION} && \
    mkdir -p /workspace && \
    mkdir -p /.platformio && \
    chmod a+rwx /.platformio && \
    # Uncomment below line to disable PIO telemetry https://docs.platformio.org/en/latest/core/userguide/cmd_settings.html#enable-telemetry
    # pio settings set enable_telemetry false && \
    apt update && apt install -y git && apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/

WORKDIR /workspace

ENTRYPOINT ["platformio"] 
