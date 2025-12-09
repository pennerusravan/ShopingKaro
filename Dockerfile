FROM node:18
ENV NODE_ENV=production
COPY . /app
WORKDIR /app
RUN npm ci --only=production
CMD ["node", "index.js"]