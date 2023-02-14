FROM postgres:13.6

ENV TZ Asia/Tokyo
RUN mkdir -p /src
COPY . ./src
WORKDIR /src
EXPOSE 5432