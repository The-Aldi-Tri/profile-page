# This Dockerfile is used to build a Docker image for a Node.js application.

# It starts with a base image of Node.js 18.13.0-slim.
FROM node:20.13.0-alpine

# Create a directory for the application and set ownership to the 'node' user.
RUN mkdir -p /home/node/react-app && chown -R node:node /home/node/react-app

# Set the working directory to the application directory.
WORKDIR /home/node/react-app

# Copy package.json and package-lock.json files to the working directory.
COPY --chown=node package*.json .

# Switch to the 'node' user for the following commands.
USER node

# Install dependencies using npm.
RUN npm install

# Copy the rest of the application files to the working directory, with ownership set to 'node' user.
COPY --chown=node . .

# Expose port for the application to listen on.
EXPOSE 3000

# Set the command to run when the container starts.
CMD [ "npm", "start"]
