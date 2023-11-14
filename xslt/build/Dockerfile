FROM eclipse-temurin

RUN apt-get update && apt-get install unzip -y

WORKDIR /var/java/saxon
ADD https://github.com/Saxonica/Saxon-HE/raw/main/12/Java/SaxonHE12-3J.zip .
RUN unzip SaxonHE12-3J.zip
ENV SAXON_HOME=/var/java/saxon/saxon-he-12.3.jar
