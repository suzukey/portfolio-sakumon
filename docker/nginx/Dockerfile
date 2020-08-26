FROM nginx:1.17.8

ENV TZ Asia/Tokyo

COPY ./config/nginx.conf /etc/nginx/nginx.conf
COPY ./config/default.conf /etc/nginx/sites-avaliable/default
RUN mkdir /etc/nginx/sites-enabled  && \
  ln -s /etc/nginx/sites-avaliable/default /etc/nginx/sites-enabled/default
