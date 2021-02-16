### FEDORA ###

.PHONY: build-zfs-2.0.3-fedora-33-linux-5.10.15
build-zfs-2.0.3-fedora-33-linux-5.10.15:
	docker build \
		-t openzfs:2.0.3-fedora-33-linux-5.10.15 \
		-f docker/fedora/33/Dockerfile .

.PHONY: build-fedora
build-fedora: build-zfs-2.0.3-fedora-33-linux-5.10.15

### END FEDORA ###

### UBUNTU ###

.PHONY: build-zfs-2.0.3-ubuntu-20.04-linux-5.10.15
build-zfs-2.0.3-ubuntu-20.04-linux-5.10.15:
	docker build \
		-t openzfs:2.0.3-ubuntu-20.04-linux-5.10.15 \
		-f docker/ubuntu/focal/Dockerfile .

.PHONY: build-ubuntu
build-ubuntu: build-zfs-2.0.3-ubuntu-20.04-linux-5.10.15

### END UBUNTU

.PHONY: build
build: build-fedora

.PHONY: build-all
build-all:
	# dev machine is a 16 cores, building many at one time has its
	# advantages. avoid using this option with CI.
	docker-compose build --parallel

.PHONY: tag
tag:
	docker tag \
		openzfs:2.0.3-fedora-33-linux-5.10.15 \
		firefoxx04/openzfs:2.0.3-fedora-33-linux-5.10.15

	docker tag \
		openzfs:2.0.3-ubuntu-20.04-linux-5.10.15 \
		firefoxx04/openzfs:2.0.3-ubuntu-20.04-linux-5.10.15

.PHONY: push
push: tag
	docker push firefoxx04/openzfs:2.0.3-fedora-33-linux-5.10.15
	docker push firefoxx04/openzfs:2.0.3-ubuntu-20.04-linux-5.10.15
