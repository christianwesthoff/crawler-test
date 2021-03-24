FROM node:14.4.0-alpine

RUN mkdir /app
WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY package.json package-lock.json tsconfig.json /app/
RUN npm install --silent

# Or if you're using Yarn
# COPY package.json yarn.lock tsconfig.json /app/
# RUN yarn install

COPY . /app/
RUN npm run build

EXPOSE 80
CMD ["node", "dist/index.js"]