# create temp container to build a project
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# copy build folder to nginx container and execute default nginx image run command
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html