FROM node:latest AS build

WORKDIR /app
COPY ./app/welcome .
# build commands
RUN npm install
RUN npm run build --prod

FROM nginx:alpine
COPY --from=build /app/dist/welcome /usr/share/nginx/html

 
