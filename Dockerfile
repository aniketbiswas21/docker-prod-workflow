# Stage 1 - Build Phase
FROM node:12.16.1-alpine as builder

WORKDIR "/app"

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


# Stage 2 - Run Phase
FROM nginx

EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html