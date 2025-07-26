# Use the official Node.js 18 Alpine image
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Copy package files first to install dependencies efficiently
COPY package*.json ./

# Install production dependencies only
RUN npm install --production

# Copy rest of the app
COPY . .

# Set environment variable for production
ENV NODE_ENV=production

# Expose port (this will be used by Docker/Railway/Render)
EXPOSE 3000

# Start the app
CMD ["node", "app.js"]
