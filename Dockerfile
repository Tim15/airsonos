# use 12.04 precise (https://github.com/docker/docker/issues/5899)
#FROM node:8
FROM node:alpine

EXPOSE 5000 5001 5002 5003 5004 5005 5006 5006 5007 5008 5009 5010 5011 5012 5013 5014 5015

WORKDIR /airsonos

RUN apk add --no-cache git make gcc g++ python avahi sudo avahi-dev

COPY package.json .
ADD lib lib
ADD bin bin
COPY index.js .
COPY package-lock.json .

RUN sudo npm install --unsafe-perm

RUN apk del make gcc g++ python git

CMD ["npm", "start"]