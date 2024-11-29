# Stage 1. Build the Vue.js app
# Base image
#FROM balenalib/raspberry-pi-alpine-node:latest as build-stage
FROM node:20.18-alpine3.19 as build-stage

# Postavljanje radnog direktorija
WORKDIR /app

# Kopiranje aplikacijskih datoteka
COPY package.json package-lock.json ./
RUN npm install

COPY . .

# start both service using simple script
# CMD sh -c "serve -s /app/dist -l 3011 & json-server --watch /app/src/jobs.json --port 5000"
#CMD sh -c "serve -s /app/dist -l 3011 & json-server --watch /app/src/jobs.json --port 5000 --host 0.0.0.0 --cors"
CMD ["sh", "-c", "json-server --watch /app/src/jobs.json --port 5000 & npm run dev -- --host"]