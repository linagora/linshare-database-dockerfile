FROM postgres:9.5

MAINTAINER Thomas Sarboni <tsarboni@linagora.com>

EXPOSE 5432

ARG VERSION="1.11.4"
ARG CHANNEL="releases"

RUN apt-get update && apt-get install wget unzip -y && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "$CHANNEL" | grep "releases" 2>&1 > /dev/null \
 && URL="https://nexus.linagora.com/service/local/artifact/maven/content?r=linshare-${CHANNEL}&g=org.linagora.linshare&a=linshare-core&v=${VERSION}" \
 || URL="https://nexus.linagora.com/service/local/artifact/maven/content?r=linshare-${CHANNEL}&g=org.linagora.linshare&a=linshare-core&v=${VERSION}-SNAPSHOT"; \
 wget --no-check-certificate --progress=bar:force:noscroll \
 -O linshare.war "${URL}&p=war" \
 && wget --no-check-certificate --progress=bar:force:noscroll \
 -O linshare.war.sha1 "${URL}&p=war.sha1" \
 && sed -i 's#^\(.*\)#\1\tlinshare.war#' linshare.war.sha1 \
 && sha1sum -c linshare.war.sha1 --quiet && rm -f linshare.war.sha1

RUN unzip linshare.war \
 WEB-INF/classes/sql/postgresql/createSchema.sql \
 WEB-INF/classes/sql/postgresql/import-postgresql.sql \
 -d / && rm -f linshare.war

COPY createDatabase.sql /docker-entrypoint-initdb.d/00_createDatabase.sql

COPY init-pg.sh /docker-entrypoint-initdb.d/01_init-pg.sh

