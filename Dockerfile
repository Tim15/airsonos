# use 12.04 precise (https://github.com/docker/docker/issues/5899)
FROM node:alpine

EXPOSE 5000 5001 5002 5003 5004 5005 5006 5006 5007 5008 5009 5010 5011 5012 5013 5014 5015

WORKDIR /airsonos

COPY package.json .
COPY package-lock.json .

RUN apk add --no-cache git make gcc g++ python 
#&& \
RUN npm install --production 
#&& \
# apk del make gcc g++ python git

#RUN npm install && npm ls
#COPY bin /airsonos/bin/
#COPY node_modules /node_modules
#COPY init /airsonos/init/
#RUN ls -ltr /airsonos
#RUN mv /airsonos/node_modules /node_modules

#COPY . /airsonos

#CMD ["npm", "start"]

#USER node