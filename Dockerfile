FROM node:18-alpine

# Install dependencies for native modules
RUN apk add --no-cache git python3 make g++

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy project files
COPY . .

# Compile contracts
RUN npx hardhat compile

# Run tests by default
CMD ["npx", "hardhat", "test"]
