FROM mongo:3.6.19-xenial
WORKDIR /scripts

COPY ./mongo_setup.sh ./

ENTRYPOINT [ "bash", "/scripts/mongo_setup.sh"]
