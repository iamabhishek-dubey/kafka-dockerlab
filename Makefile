build-zookeper:
	cd zookeper; docker build -t zookeeper:latest -f Dockerfile .

run-zookeper:
	docker rm -f zookeeper || true
	docker run -itd --name zookeeper -p 2181:2181 zookeeper:latest

build-kafka:
	cd kafka; docker build -t kafka:latest -f Dockerfile .

run-kafka:
	docker rm -f kafka || true
	docker run -itd --name kafka -p 7203:7203 -p 9092:9092 -e KAFKA_ADVERTISED_HOST_NAME=${KAFKA_IP} -e ZOOKEEPER_IP=${ZOOKEEPER_IP} kafka:latest
