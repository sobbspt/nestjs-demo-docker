FROM node:16-alpine

WORKDIR /home/node

COPY . .

RUN yarn install
RUN yarn build

CMD ["yarn", "start:prod"]
