package parallel

import "time"

func FetchUser() string {
	time.Sleep(time.Millisecond * 100)
	return "my-name"
}

func FetchUserAge(userId string) int {
	time.Sleep(time.Millisecond * 150)
	return len(userId)
}

func FetchUserType(userId string) string {
	time.Sleep(time.Millisecond * 150)
	return userId + "-type"
}
