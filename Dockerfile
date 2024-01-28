FROM node:lts as build

LABEL com.centurylinklabs.watchtower.enable="true"
LABEL Maintainer="André Lademann <andre@nullzueins.com>" \
      Description="Website."

COPY ./app /app

# Install pnpm
RUN npm install -g pnpm

# Install dependencies
WORKDIR /app
RUN pnpm install
# RUN npm install


# Build the app
RUN pnpm build

# Stage 2: Setup runtime container
FROM nginx:alpine

# Copy our build from the previous stage
COPY --from=build /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Run the web service on container startup
CMD ["nginx", "-g", "daemon off;"]

# Healthcheck
HEALTHCHECK --interval=5s --timeout=3s --retries=3 CMD wget --quiet --tries=1 --spider http://localhost || exit 1
