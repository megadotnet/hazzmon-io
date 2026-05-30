# Multi-stage Dockerfile for hazzmon-core
# Build stage using Eclipse Temurin JDK 21
FROM eclipse-temurin:21-jdk-jammy AS builder

WORKDIR /app

# Install Maven
RUN apt-get update && apt-get install -y maven && rm -rf /var/lib/apt/lists/*

# Copy only pom.xml first to leverage Docker layer caching
COPY hazzmon-core/pom.xml ./hazzmon-core/pom.xml

# Download dependencies
WORKDIR /app/hazzmon-core
RUN mvn dependency:go-offline -B || true

# Copy source code and build
COPY hazzmon-core/src ./src
RUN mvn clean package -DskipTests -B

# Runtime stage using Eclipse Temurin JRE 21
FROM eclipse-temurin:21-jre-jammy AS runtime

WORKDIR /app

# Create non-root user for security
RUN groupadd --gid 1001 appgroup && \
    useradd --uid 1001 --gid appgroup --shell /bin/bash --create-home appuser

# Copy the built jar from builder stage
COPY --from=builder /app/hazzmon-core/target/*.jar app.jar

# Change ownership to non-root user
RUN chown appuser:appgroup app.jar

USER appuser

# Expose standard application port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=40s --retries=3 \
    CMD java -Djava.security.egd=file:/dev/./urandom -jar app.jar --server.port=8080 > /dev/null 2>&1 || exit 1

# Run the application
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]
