SHELL := /bin/bash

run:
	go run ./

build:
	go build -ldflags "-X main.build=local"