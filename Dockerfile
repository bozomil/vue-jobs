# Koristimo Node.js sliku za buildanje Vue aplikacije
FROM node:alpine as build

# Postavljanje radnog direktorija unutar kontejnera
WORKDIR /app

# Kopiranje package.json i package-lock.json
COPY package*.json ./

# Instaliranje zavisnosti
RUN npm install

# Kopiranje svih drugih datoteka u kontejner
COPY . .

# Izlažemo portove za Vue aplikaciju i JSON-server
EXPOSE 3011 5000

# Gradnja Vue aplikacije
RUN npm run build

# Ovdje ne trebamo Nginx jer će Nginx biti upravljan u drugom kontejneru
# Jednostavno izlažemo statičke datoteke iz builda
CMD ["npm", "run", "server"]  # Pokreni Vue aplikaciju u razvoju (ako se koristi dev server)