# ---------- Stage 1: Build Flutter web app ----------
FROM ghcr.io/cirruslabs/flutter:3.35.1 AS build
WORKDIR /app

# Cache dependencies
COPY pubspec.* ./
RUN flutter pub get

# Copy rest of project and build
COPY . .
RUN flutter pub get --offline

# Build with /api so requests go through Nginx reverse proxy
RUN flutter build web --release --dart-define=API_BASE_URL=/api

# ---------- Stage 2: Serve with Nginx ----------
FROM nginx:alpine

# Copy custom nginx config
COPY deploy/nginx.conf /etc/nginx/conf.d/default.conf

# Copy built Flutter web app
COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
