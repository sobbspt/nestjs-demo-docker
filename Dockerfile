FROM node:16-alpine as builder

WORKDIR /home/node

COPY . .

RUN yarn install
RUN yarn build

FROM node:16-alpine

COPY --from=builder /home/node/dist ./dist
CMD ["node", "dist/main.js"]
