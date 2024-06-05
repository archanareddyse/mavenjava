# Step 1: Use a Maven image with JDK for building the application
FROM maven:3.8.5-openjdk-17 AS build

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the pom.xml file and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Step 4: Copy the application source code and build the application
COPY src ./src
RUN mvn package -DskipTests

# Step 5: Use a minimal base image for running the application
FROM openjdk:17-jdk-slim

# Step 6: Set the working directory inside the container
WORKDIR /app

# Step 7: Copy the built JAR file from the build stage
COPY --from=build /app/target/your-app-name.jar ./your-app-name.jar

# Step 8: Specify the command to run the application
CMD ["java", "-jar", "your-app-name.jar"]
