FROM node:14.16.0-alpine3.12 as builder
WORKDIR /usr/app
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html
