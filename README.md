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

docker run --gpus 4 -d -p 11434:11434 lakshmikanth09/ollama-server:latest
docker run --gpus all -d -p 11434:11434 lakshmikanth09/ollama-server:latest



## Alternative GPU Options


docker run -d --name ollama-server --gpus 4 lakshmikanth09/ollama-server:latest

### If you don’t want to use all GPUs, you can specify individual ones:

#### Use a Specific GPU (e.g., GPU 0)

docker run --gpus '"device=0"' -d -p 11434:11434 lakshmikanth09/ollama-server:latest

### Only GPU 0 is assigned to the container.
### Use Multiple GPUs (e.g., GPU 0 and 1)

docker run --gpus '"device=0,1"' -d -p 11434:11434 lakshmikanth09/ollama-server:latest

Assigns both GPU 0 and GPU 1 to the container.


## Command to Allocate 4 CPUs and Specific GPUs

docker run --gpus '"device=0,1"' --cpus 4 -d -p 11434:11434 yourusername/ollama-server:latest



## Check the number of CPU cores:

Summary
OS	Command
Linux	nproc or lscpu
macOS	sysctl -n hw.ncpu



#### Check Available GPUs Before Running
To see how many GPUs are available on your system, run:

nvidia-si


###### Verify GPU Allocation in the Running Container###### 
###### After starting the container, check if it's using the allocated GPUs:

 docker exec -it ollama-server nvidia-smi