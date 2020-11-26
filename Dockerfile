FROM node:14 as builder
WORKDIR /code
COPY package* ./
RUN npm install && npm run build

FROM node:14
WORKDIR /code
ADD . .
COPY --from=builder /code/ ./
CMD [ "node","server" ]