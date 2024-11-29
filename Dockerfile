# Stage 1. Build the Vue.js app
# Base image
#FROM balenalib/raspberry-pi-alpine-node:latest as build-stage
FROM node:20.18-alpine3.19
# Postavljanje radnog direktorija
WORKDIR /app

# Kopiranje package.json i package-lock.json
COPY package*.json ./

# install project dependencies
RUN npm install

# Kopiranje svih drugih datoteka u kontejner
COPY . .

# Expose ports
EXPOSE 3011 5000

# start both service using simple script
# CMD sh -c "serve -s /app/dist -l 3011 & json-server --watch /app/src/jobs.json --port 5000"
# CMD sh -c "serve -s /app/dist -l 3011 & json-server --watch /app/src/jobs.json --port 5000 --host 0.0.0.0 --cors"
# CMD ["sh", "-c", "json-server --watch /app/src/jobs.json --port 5000 & npm run dev -- --host & npm run server"]
#CMD ["sh", "-c", "npm run dev -- --host & npm run server"]

CMD ["sh", "-c", "npm run dev -- --host & npm run server & --watch /app/src/jobs.json --port 5000 --host 0.0.0.0"]