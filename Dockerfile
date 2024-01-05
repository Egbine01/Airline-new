FROM ubuntu:20.04

# Install our dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    openjdk-17-jdk \
    x11-apps \
    xvfb \
    && rm -rf /var/lib/apt/lists/*
	
	

# Set our working directory
WORKDIR /app

# Copy our application JAR file
COPY target/AirlineSystem-Version1.jar /app/AirlineSystem-Version1.jar

EXPOSE 8080

# Run Xvfb and your Java application
CMD Xvfb :0 -screen 0 1024x768x16 & \
    export DISPLAY=:0 && \
    java -jar AirlineSystem-Version1.jar
