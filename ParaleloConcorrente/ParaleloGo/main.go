package main

import (
	"ParaleloGo/parallel"
	"fmt"
	"time"
)

func main() {
	start := time.Now()
	user := parallel.FetchUser()

	res := parallel.FetchUserData(user)

	fmt.Println("User Age:", res.Age)
	fmt.Println("User Type:", res.Type)

	fmt.Println("Took:", time.Since(start))
}
