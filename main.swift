

import Foundation

func main() {
    
    fileFetch() // // toDoList의 정보를 가져오는 함수
    
    while true {
        
        printInfo() // 화면 정보를 출력하는 함수
        
        if let input = readLine() { // 값을 입력 받는다
            
            if input == "X" { // X를 입력 할 때
                
                fileStore() // toDoList의 정보를 저장하는 함수
                print("프로그램을 종료합니다...")
                break
            }
            
            switch input {
              case "1":
                toDoAdd()    // 1. 할 일 추가 함수
              case "2":
                toDoRemove() // 2. 할 일 삭제 함수
              case "3":
                toDoEdit()   // 3. 할 일 내용 수정 함수
              case "4":
                toDoStatus() // 4. 할 일 상태 변경 함수
              case "5":
                toDoPrint()  // 5. 전체 할 일 목록 함수
              case "6":
                toDoFinish() // 6. 완료된 할 일 목록 함수
              default: // 번호를 잘못 입력했을 때
                print("잘못된 입력입니다. 1~6 사이의 숫자 혹은 X를 입력해주세요.")
            }

        }
        
    }
}

main()
