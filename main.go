package main

import (
	"fmt"
	"os"
	"os/signal"
	"syscall"
)

var build = "develop"

func main() {
	fmt.Println("Hello:::", build)

	shutdownC := make(chan os.Signal, 1)
	signal.Notify(shutdownC, syscall.SIGINT, syscall.SIGTERM)
	<-shutdownC

	fmt.Println("Program shut down:::")
}