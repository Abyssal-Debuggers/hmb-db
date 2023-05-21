package main

import (
	"fmt"
	"os"
	"os/exec"
)

func main() {
	const temppw = "hmbdb"
	var schemas = []string{"account", "hmb"}
	fmt.Println("도커 이미지 빌드 중")
	exec.Command("docker", "build", "./.docker", "--no-cache", "-t", "local-hmb-db", "--build-arg", fmt.Sprintf("POSTGRES_PASSWORD=%s", temppw)).Run()
	fmt.Println("도커 이미지 실행 중")
	exec.Command("docker", "run", "-d", "--name", "local-hmb-db", "-p", "5432:5432", "local-hmb-db").Run()
	fmt.Println("jet 실행")
	// jet -source=postgres -host=localhost -port=5432 -user=postgres -password=hmbdb -dbname=postgres -schema=account
	// jet -source=postgres -host=localhost -port=5432 -user=postgres -password=hmbdb -dbname=postgres -schema=hmb
	for _, schema := range schemas {
		exec.Command("jet", "-source=postgres", "-host=localhost", "-port=5432", "-user=postgres", fmt.Sprintf("-password=%s", temppw), "-dbname=postgres", fmt.Sprintf("-schema=%s", schema)).Run()
	}
	os.Exit(0)
}
