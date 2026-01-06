# Use a modern Node LTS image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of the app
COPY . .

# Expose application port
EXPOSE 8000

# Health check (using wget instead of curl)
HEALTHCHECK --interval=5s --timeout=5s \
  CMD wget -qO- http://127.0.0.1:8000 || exit 1

# Start the application
CMD ["npm", "start"]
