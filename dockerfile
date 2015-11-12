FROM node:latest

EXPOSE 3000

ADD ./src/node_server /usr/node_server
WORKDIR /usr/node_server

CMD node app.js