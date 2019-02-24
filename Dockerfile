FROM node:alpine as builder
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

# /app/build  <--- all the stuff

# https://www.udemy.com/docker-and-kubernetes-the-complete-guide/learn/v4/t/lecture/11437096?start=220
# Don't worry about it any single block or any single face here can only have a single from statement.
# So you can kind of imagine that the from statements we put in here are kind of terminating each successive block.
FROM nginx
# https://hub.docker.com/_/nginx
# look at --> How to use this image
EXPOSE 80
# for developer and ElastiBeanStalk
COPY --from=builder /app/build /usr/share/nginx/html
# So we don't have to actually specifically run anything to startup nginx
# when we start up the nginx container. It's going to take care of the command for us automatically.

