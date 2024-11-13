# Use the Latest Version of Ubuntu - Base Image
FROM ubuntu:latest

# Maintainer Label
LABEL maintainer="Or Toledano"

# Update the Package 
RUN apt-get update && apt-get install -y coreutils

# The CMD to run 'yes' with 'DEVOPS' argument
CMD ["yes", "DEVOPS"]
