# Build Stage
# Using Go 1.22 on Alpine for a small and secure build environment
FROM golang:1.22-alpine AS build-stage

LABEL app="build-{{cookiecutter.component_id}}"
LABEL REPO="https://github.com/{{cookiecutter.github_username}}/{{cookiecutter.component_id}}"

WORKDIR /app

# Copy go module files
COPY go.mod go.sum ./
# Download dependencies - this layer is cached unless go.mod/go.sum changes
RUN go mod download && go mod verify

# Copy the rest of the application's source code
COPY . .

# Run the build process (assuming 'make build-alpine' compiles the Go binary)
# Ensure 'make build-alpine' outputs the binary to a predictable path, e.g., /app/bin/{{cookiecutter.component_id}}
RUN make build-alpine

# Final Stage
# Use the user-defined or default Alpine-based image for the final small image
FROM {{cookiecutter.docker_image}}

ARG GIT_COMMIT
ARG VERSION
LABEL REPO="https://github.com/{{cookiecutter.github_username}}/{{cookiecutter.component_id}}"
LABEL GIT_COMMIT=$GIT_COMMIT
LABEL VERSION=$VERSION

# Set working directory for the final application
WORKDIR /opt/{{cookiecutter.component_id}}/bin

# Copy the compiled binary from the build stage
# Ensure the source path matches the output location from 'make build-alpine' in the build-stage
COPY --from=build-stage /app/bin/{{cookiecutter.component_id}} .
RUN chmod +x ./{{cookiecutter.component_id}}

# Create a non-root user and switch to it
RUN adduser -D -g '' {{cookiecutter.component_id}}
USER {{cookiecutter.component_id}}

# Using dumb-init as an entrypoint to handle signals correctly
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# Command to run the application
CMD ["./{{cookiecutter.component_id}}"]
