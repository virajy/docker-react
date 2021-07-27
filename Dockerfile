FROM node:alpine as builder1

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder1 /app/build /usr/share/nginx/html