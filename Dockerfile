# Use the official Node.js image from the Docker Hub
FROM node:14

# Create and change to the app directory
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image
COPY package*.json ./

# Install dependencies
RUN npm config set registry https://registry.npmmirror.com/ && npm install

# Copy the application code to the container image
COPY . .

# Make the container's port 8080 available to the outside world
EXPOSE 8080

# Run the web service on container startup
CMD ["npm", "start"]
