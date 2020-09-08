FROM mongo:latest
WORKDIR /scripts

COPY ./mongo_setup.sh ./

ENTRYPOINT [ "bash", "/scripts/mongo_setup.sh"]
