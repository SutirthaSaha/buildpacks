# Use the same base image that your buildpack uses  
FROM paketobuildpacks/run:base-cnb  
  
USER root  
RUN apt-get update && apt-get install -y curl 
