FROM node:17
WORKDIR /app
COPY package*.json ./
RUN npm install

ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
        then npm install; \
        else npm install --only=production; \
        fi

COPY ./ ./ 
EXPOSE 8080
CMD ["npm", "run", "start"]