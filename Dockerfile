FROM node:18 AS build

COPY package*.json .

RUN npm ci

COPY . .

RUN npm run build

FROM nginx:latest

COPY --from=build dist /var/www/web/

COPY nginx.conf /etc/nginx/conf.d/default.conf
