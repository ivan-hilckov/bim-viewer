FROM node:14-alpine AS development
ENV NODE_ENV development
# Add a work directory
WORKDIR /app
# Cache and Install dependencies
COPY package.json .
# COPY yarn.lock .
RUN apk add --no-cache python3 make g++
RUN yarn install --silent
# Copy app files
COPY . .
# Expose port
EXPOSE 8080
# Start the app
CMD ["yarn", "serve"]
