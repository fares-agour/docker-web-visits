# Use the official Node.js runtime as a parent image & select its tag version alpine
FROM node:alpine as builder

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Expose port 3000 for the Node.js application
EXPOSE 3000

# Start the Node.js application
CMD node index.js


