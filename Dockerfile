# Use the latest Arch Linux image as the base
FROM archlinux:latest

# Update and install necessary packages
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm wget base-devel pcre2 && \
    # Cleaning up cache to reduce layer size
    pacman -Scc --noconfirm

# Download and install Go 1.22.1
RUN wget https://golang.org/dl/go1.22.1.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz && \
    rm go1.22.1.linux-amd64.tar.gz

# Set environment variables for Go
ENV PATH=/usr/local/go/bin:$PATH

# Set the working directory inside the container
WORKDIR /app

# Uncomment the following lines if you want to copy your Go application into the container
# and build it as part of the Docker image. Make sure your application's entry point is
# correctly specified in the COPY and RUN commands.

COPY . .
RUN go build -o ittf-pcre2-test

# Command to run when the container starts.
# Adjust the CMD instruction based on what you want the container to do by default.

CMD ["/bin/bash"]
