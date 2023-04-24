SHELL := /bin/bash

run:
	go run ./

build:
	go build -ldflags "-X main.build=local"

VERSION := 1.0

all: service

service:
	docker build \
			-f zarf/docker/Dockerfile \
			-t service-amd64:$(VERSION) \
			--build-arg BUILD_REF=$(VERSION) \
			--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
			.