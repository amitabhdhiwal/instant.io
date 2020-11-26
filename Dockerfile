FROM node:14 as builder
WORKDIR /code
COPY package* ./
RUN npm install

FROM node:14
WORKDIR /code
ADD . .
COPY --from=builder /code/ ./
RUN npm run build
CMD [ "node","server" ]
