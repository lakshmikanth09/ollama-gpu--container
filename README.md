docker build -t ollama-server .

docker images

docker run --gpus all -d --name ollama-container -p 11434:11434 ollama-server


docker exec -it ollama-container bash


ollama pull llama3


ollama list


docker run --gpus all -d --name ollama-container -p 11434:11434 -v ollama-data:/root/.ollama ollama-server



docker stop ollama-container


docker rm -f ollama-container
docker rmi ollama-server

# ollama-gpu--container
