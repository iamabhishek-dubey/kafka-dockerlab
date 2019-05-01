build-zookeper:
	cd zookeper; docker build -t zookeeper:latest -f Dockerfile .

run-zookeper:
	docker rm -f zookeeper || true
	docker run -itd --name zookeeper -p 2181:2181 zookeeper:latest

