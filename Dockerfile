FROM mongo:4.2.9-bionic
WORKDIR /scripts

COPY ./mongo_setup.sh ./

ENTRYPOINT [ "bash", "/scripts/mongo_setup.sh"]
