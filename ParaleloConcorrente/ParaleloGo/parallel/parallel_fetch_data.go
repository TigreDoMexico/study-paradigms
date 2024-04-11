package parallel

import "sync"

type UserData struct {
	Age  int
	Type string
}

func FetchUserData(userId string) UserData {
	group := &sync.WaitGroup{}
	out := make(chan any, 2)

	group.Add(1)
	go UserAge(userId, group, out)

	group.Add(1)
	go UserType(userId, group, out)

	go Stop(group, out)

	return PrepareReturnData(out)
}

func UserAge(userId string, group *sync.WaitGroup, out chan any) {
	age := FetchUserAge(userId)
	defer group.Done()
	out <- age
}

func UserType(userId string, group *sync.WaitGroup, out chan any) {
	type2 := FetchUserType(userId)
	defer group.Done()
	out <- type2
}

func Stop(group *sync.WaitGroup, out chan any) {
	group.Wait()
	close(out)
}

func PrepareReturnData(out chan any) UserData {
	dataResult := UserData{}

	for data := range out {
		if d, ok := data.(int); ok {
			dataResult.Age = d
		}

		if d, ok := data.(string); ok {
			dataResult.Type = d
		}
	}

	return dataResult
}
