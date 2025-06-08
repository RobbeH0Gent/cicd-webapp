# Node.js base image
FROM node:20.19.2-alpine

# The main application directory
WORKDIR /app

# Copy the app package and package-lock.json
COPY package*.json yarn.lock ./

# Copy local directories to the current local directory of our docker image
COPY ./src ./src
COPY tests ./tests

# Install the dependencies
RUN yarn install --frozen-lockfile

EXPOSE 3000

# Start the application
CMD ["yarn", "start"]
