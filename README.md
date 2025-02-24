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





docker login


docker build -t ollama-server .



docker tag ollama-server lakshmikanth09/ollama-server:latest


docker push lakshmikanth09/ollama-server:latest



# Step 6: Pull and Run the Image from Docker Hub (Test on Another Machine)
## Now, you (or anyone) can pull and run your published image using:


docker pull lakshmikanth09/ollama-server:latest

Run it with:

docker run --gpus all -d -p 11434:11434 lakshmikanth09/ollama-server:latest
