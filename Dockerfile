# Use an NVIDIA CUDA base image with Ubuntu
FROM nvidia/cuda:12.1.0-base-ubuntu22.04

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Ollama binary
RUN curl -fsSL https://ollama.com/install.sh | sh


# Expose the default Ollama port
EXPOSE 11434

# Set volume for persistent model storage
VOLUME /root/.ollama

# (Optional) Pre-load a model during build time
# Uncomment the following line to pre-pull a model like llama3
RUN ollama pull llama3

# Set environment variables (optional)
ENV OLLAMA_HOST=0.0.0.0
ENV OLLAMA_PORT=11434

# Command to run Ollama
CMD ["ollama", "serve"]