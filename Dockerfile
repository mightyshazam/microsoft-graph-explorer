FROM node:8-alpine as builder
WORKDIR /usr/src/app
RUN apk update && apk upgrade && \
    apk add --no-cache git
COPY package.json .
RUN npm install

COPY . .
RUN npm run build

ENTRYPOINT sh docker/run.sh $CLIENTID secrets.js
#FROM node:8-alpine
#WORKDIR /app
#COPY --from=builder /usr/src/app/dist/* /app/
#    && npm test \
#    && npm run import:loc-strings \
#    && 
#EXPOSE 3000
#ENTRYPOINT ["node","explorer.js"]
