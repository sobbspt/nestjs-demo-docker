FROM node:16-alpine as builder

WORKDIR /home/node

COPY . .

RUN yarn install
RUN yarn build

FROM node:16-alpine

COPY --from=builder /home/node/dist ./dist
COPY --from=builder --chown=node:node /home/node/node_modules/ ./node_modules/
CMD ["node", "dist/main"]
