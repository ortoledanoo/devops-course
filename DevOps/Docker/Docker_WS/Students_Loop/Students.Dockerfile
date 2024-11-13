# Use the Latest Version of Ubuntu - Base Image
FROM ubuntu:latest

# Update the Package 
RUN apt-get update && apt-get install -y

COPY Students_Loop.sh /usr/local/bin/Students_Loop.sh

RUN chmod +x /usr/local/bin/Students_Loop.sh

# The CMD to run 'yes' with 'DEVOPS' argument
CMD ["/usr/local/bin/Students_Loop.sh"]
