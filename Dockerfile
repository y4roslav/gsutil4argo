FROM python:2.7

LABEL mainteiner "Yaroslav Ravlinko <yaroslav@7insyde.com>"

ARG APP_HOME=/application

ENV GOOGLE_APPLICATION_CREDENTIALS /app/access/access.json
ENV SRC_FOLDER gs://bucket/
ENV DST_FOLDER /data
ENV PATH ${PATH}:/${APP_HOME}/google-cloud-sdk/bin

RUN mkdir -p ${APP_HOME}
WORKDIR ${APP_HOME}

RUN wget -c https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.tar.gz \
    && tar -zxvf google-cloud-sdk.tar.gz \
    && cd google-cloud-sdk \
    && ./install.sh --path-update=true --usage-reporting=false --command-completion=false 
