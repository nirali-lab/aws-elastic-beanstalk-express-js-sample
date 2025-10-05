
# (Assignment uses Node 16; )
FROM node:16-alpine

# Set working directory inside the container
WORKDIR /usr/src/app

# Install deps first
COPY package*.json ./
# If your repo has only "package.json" , this still works
RUN npm ci --omit=dev || npm install --omit=dev

# Copy the source
COPY . .

# Set NODE_ENV and the port the sample app uses
ENV NODE_ENV=production PORT=8081

# The AWS sample listens on 8081 by default
EXPOSE 8081

# Start the app
CMD ["npm", "start"]
