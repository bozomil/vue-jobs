FROM node:20.18-alpine3.19

# Postavljamo radni direktorij na /app
WORKDIR /app

# Kopiramo package*.json datoteke u radni direktorij
COPY package*.json ./

# Instaliramo ovisnosti
RUN npm install

# Kopiramo aplikacijski kod u radni direktorij
COPY . .

# Pokrećemo json-server na portu 5000
#RUN npm run server --port 5000 &
#RUN npm run dev --port 3011 &

# start both service using simple script
CMD ["sh", "-c", "npm run dev -- --host & npm run server"]
