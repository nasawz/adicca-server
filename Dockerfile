FROM node:carbon

RUN mkdir -p /adicca-server
COPY ./dist /adicca-server/
COPY ./node_modules /adicca-server/node_modules
COPY ./package.json /adicca-server/package.json

RUN mkdir -p /adicca-server/config
VOLUME /adicca-server/config

RUN mkdir -p /adicca-server/cloud
VOLUME /adicca-server/cloud

WORKDIR /adicca-server

# RUN npm install && \
#     npm run build

ENV PORT=1337

EXPOSE $PORT

ENTRYPOINT ["npm", "start", "--"]
