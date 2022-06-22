FROM nikolaik/python-nodejs:python3.6-nodejs14-alpine

# Create app directory
WORKDIR /usr/src/app
ENV PORT 443
ENV CI=true
ENV REACT_APP_VERSION={REACT_APP_VERSION}

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install -g npm@7.20.5

RUN npm install

ENV PATH="./node_modules/.bin:$PATH"

# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE ${PORT}

CMD [ "npm", "start" ]