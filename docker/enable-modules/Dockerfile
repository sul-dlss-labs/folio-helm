FROM ubuntu:latest

#Prerequisites
RUN apt-get update
RUN apt-get install curl postgresql-client -y

#Create folders in container
RUN mkdir -p /usr/local/bin/folio/install

#Set working directory
WORKDIR /usr/local/bin/folio

#Copy in scripts and files
COPY create-deploy.sh /usr/local/bin/folio
COPY init.sh /usr/local/bin/folio
COPY create_views.sql /usr/local/bin/folio

#Set environment variables for script
ENV OKAPI_URL='http://okapi-jgreben.dev.sul.stanford.edu'
ENV MODULE_NAME=''
ENV TENANT_ID='sul'
ENV SAMPLE_DATA='true'
ENV REF_DATA='true'
ENV DB_PASSWORD='EfAdCymKecZov'
ENV DB_HOST='folio-jgreben-okapi-rds.clqwjadk8neo.us-west-2.rds.amazonaws.com'
ENV DB_DATABASE='okapi'
ENV DB_USERNAME='okapi'
ENV SQL_WHERE=" module_requestor_name like 'mod%' "


#Execute the script on container runtime
CMD ["/usr/local/bin/folio/init.sh"]
