FROM node:16.17.0-buster as builder
ENV VUE_APP_BASE_URL=

WORKDIR /home
COPY . .
RUN npm install
RUN npm run build

FROM nginx
RUN mkdir /home/dist/
COPY --from=builder /home/dist/ /home/dist/
COPY deployment/config/nginx.conf /etc/nginx/conf.d/default.conf