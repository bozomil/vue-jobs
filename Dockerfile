# Stage 1. Build the Vue.js app
# Base image
#FROM balenalib/raspberry-pi-alpine-node:latest as build-stage
FROM node:20.18-alpine3.19 as build-stage

# Postavljanje radnog direktorija unutar kontejnera
WORKDIR /app

# Kopiranje package.json i package-lock.json
COPY package*.json ./

# install project dependencies
RUN npm install

# Kopiranje svih drugih datoteka u kontejner
COPY . .

# Build
RUN npm run build

#Stage 2. Setup finale container
FROM node:20.18-alpine3.19
WORKDIR /app

#install json-server globally
RUN npm install -g json-server

# copy the build output from the build stage
COPY --from=build-stage /app/dist/ /app/dist/

COPY src/jobs.json /app/src/jobs.json

#install http-server
RUN npm install -g http-server

# Izlažemo potrebne portove
EXPOSE 3011
EXPOSE 5000

# start both service using simple script
CMD sh -c "http-server /app/dist - p 3011 & json-server --watch /app/src/jobs.json --port 5000"