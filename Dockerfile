# Koristimo Node.js sliku za buildanje Vue aplikacije
FROM balenalib/raspberry-pi-alpine-node:latest
# FROM node:alpine

# Postavljanje radnog direktorija unutar kontejnera
WORKDIR /app

# Kopiranje package.json i package-lock.json
COPY package*.json ./

# Instaliranje zavisnosti
RUN npm install

# Kopiranje svih drugih datoteka u kontejner
COPY . .

# Instaliramo concurrently za paralelno pokretanje skripti
# RUN npm install -g concurrently

# Izlažemo potrebne portove
EXPOSE 3011 5000

# Defaultna komanda za pokretanje Vue aplikacije i JSON-servera
#CMD ["npm run server", "npm run dev"]
#CMD ["npm run ser"]
CMD ["npm", "run", "dev"]