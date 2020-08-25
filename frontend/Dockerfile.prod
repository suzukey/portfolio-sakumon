FROM node:14.2.0

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
ENV NUXT_HOST=0.0.0.0

RUN apt-get update

WORKDIR /app

COPY app/package.json .
COPY app/yarn.lock .

RUN yarn install

COPY app/ .

RUN yarn build

EXPOSE 3000
CMD ["yarn", "start"]
