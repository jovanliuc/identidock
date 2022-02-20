FROM python:latest

RUN groupadd -r uwsgigroup && useradd -r -g uwsgigroup uwsgiuser
RUN pip install Flask uWSGI requests redis
WORKDIR /app
COPY app /app
COPY cmd.sh /

EXPOSE 9090 9191
USER uwsgiuser

CMD ["/cmd.sh"]