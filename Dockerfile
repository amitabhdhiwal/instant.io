FROM node:10 as builder
WORKDIR /code
COPY package* ./
RUN npm install

FROM node:10
WORKDIR /code
ADD . .
COPY --from=builder /code/ ./
RUN npm run build
CMD [ "node","server" ]
