FROM mongo:4.4.0-bionic
WORKDIR /scripts

COPY ./mongo_setup.sh ./

ENTRYPOINT [ "bash", "/scripts/mongo_setup.sh"]
