# alpine is the lightweight version of node
FROM node:14.16.0-alpine

# workdir is this app and if it doesn't exist just create it 
WORKDIR /app

# PATH env variable
# needed to use react-scripts inside container
ENV PATH /app/node_modules/.bin:$PATH

# copy package.json and package-lock.json - we want to use cache, 
# don't want to install dependencies everytime we start container (dependencies haven't changed)
COPY package*.json ./

#
RUN npm install --silent

# copy everything from root dir to inside container
# use .dockerignore to ignore some things 
# like node_modules which we will install
COPY . ./

#execute npm start
CMD ["npm", "start"]