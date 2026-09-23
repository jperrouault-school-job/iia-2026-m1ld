FROM debian:bookworm-slim

WORKDIR /app

COPY target/demo .

RUN ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
RUN echo "Europe/Paris" > /etc/timezone

EXPOSE 8080

CMD [ "./demo" ]
