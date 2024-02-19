//
//  kbsfunctions.swift
//  MyTodoListManager_1_bosung1209
//
//  Created by 김보성 on 2023/10/27.
//

import Foundation

struct toDo: Codable { // 이름, 상태, 현재시간의 정보를 저장하는 구조체
    var name: String
    var status: String
    let koreaDate: String
    
    
    init(name: String) { // 초기화 함수
        self.name = name
        self.status = "미완료"
        self.koreaDate = timeCheck()
    }
}

var toDoList: [toDo] = []  // toDo 구조체 배열

func timeCheck() -> String { // 현재 시간을 반환하는 함수
    
    let utcDate = Date() // 현재 UTC 시간을 가져오기
    
    let koreaTimeZone = TimeZone(abbreviation: "KST") // 한국 시간대를 설정

    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // YY-MM-DD hh:mm:ss 형태로 표시
    dateFormatter.timeZone = koreaTimeZone // 한국 시간대를 설정

    let koreaTime = dateFormatter.string(from: utcDate)
    
    return koreaTime
}

func resultPrint() { // toDoList의 내용을 출력하는 함수
    for i in 0...toDoList.count-1 {
        if toDoList[i].name.count > 15 { // ToDo의 내용이 15글자를 초과하는 경우
            let maxString = toDoList[i].name.prefix(15)
            toDoList[i].name = maxString + "..."
        }
        
        print("\(i) | \(toDoList[i].koreaDate) | [\(toDoList[i].status)] \(toDoList[i].name) ")
    }
}


func toDoAdd() { // 1. 할 일 추가 함수
    
    print("추가할 할 일의 내용을 입력해주세요.")
    let input = readLine()!
    let toDoKbs = toDo(name: input) // 구조체를 생성
    print("추가한 날짜 및 시간 : \(toDoKbs.koreaDate)")
    toDoList.append(toDoKbs) // 구조체를 구조체 배열에 추가
}


func toDoRemove() { // 2. 할 일 삭제 함수
    
    if toDoList.isEmpty { // toDoList 비어 있는지 확인
        print("To-do가 하나도 존재하지 않습니다. To-do를 추가해주세요.")
    }
    
    else { // toDoList 비어 있지 않으면
        resultPrint() // todolist의 내용을 출력
        
        print("삭제할 To-do의 번호를 입력해주세요.")
        if let input = Int(readLine()!) {
            if input > toDoList.count - 1 {
                print("존재하는 To-do의 번호를 입력해주세요.")
            }
            else {
                print("\(input)번 To-do를 삭제하였습니다.")
                toDoList.remove(at: input)
            }
        }
    
        else { // 숫자가 아닌 문자를 입력했을 때
            print("숫자만을 입력해주세요!")
        }
        
    }
    
}

func toDoEdit() { // 3. 할 일 내용 수정 함수
    
    if toDoList.isEmpty { // toDoList 비어 있는지 확인
        print("To-do가 하나도 존재하지 않습니다. To-do를 추가해주세요.")
    }
    else { // toDoList 비어 있지 않으면
        resultPrint() // todolist의 내용을 출력
        
        print("내용을 수정할 To-do의 번호를 입력해주세요.")
        if let input = Int(readLine()!) {
            if input > toDoList.count - 1 {
                print("존재하는 To-do의 번호를 입력해주세요.")
            }
            else {
                print("\(input)번의 To-do 내용을 수정합니다. 새로운 내용을 입력해주세요.")
                let newEdit = readLine()!
                toDoList[input].name = newEdit
                print("내용 수정을 완료했습니다.")
            }
        }
        
        else { // 숫자가 아닌 문자를 입력했을 때
            print("숫자만을 입력해주세요!")
        }
        
    }
}

func toDoStatus() { // 4. 할 일 상태 변경 함수
    
    if toDoList.isEmpty { // toDoList 비어 있는지 확인
        print("To-do가 하나도 존재하지 않습니다. To-do를 추가해주세요.")
    }
    
    else { // toDoList 비어 있지 않으면
        resultPrint() // todolist의 내용을 출력
        
        print("상태를 변경할 To-do의 번호를 입력해주세요.")
        if let input = Int(readLine()!) {
            
            if input > toDoList.count - 1 {
                print("존재하는 To-do의 번호를 입력해주세요.")
            }
            else {
                toDoList[input].status = "완료"
                print("\(input)번의 To-do 상태를 [미완료]에서 [완료]로 변경했습니다.")
            }
        }
        
        else { // 숫자가 아닌 문자를 입력했을 때
            print("숫자만을 입력해주세요!")
        }
    
    }
    
}

func toDoPrint() { // 5. 전체 할 일 목록 함수
    
    if toDoList.isEmpty { // toDoList 비어 있는지 확인
        print("To-do가 하나도 존재하지 않습니다. To-do를 추가해주세요.")
    }
    
    else { // toDoList 비어 있지 않으면
        resultPrint() // todolist의 내용을 출력
    }
}

func toDoFinish() { // 6. 완료된 할 일 목록 함수

    if toDoList.isEmpty { // toDoList 비어 있는지 확인
        print("To-do가 하나도 존재하지 않습니다. To-do를 추가해주세요.")
    }

    else { // toDoList 비어 있지 않으면

        var count = 0 // 완료 항목을 체크하는 변수

        for i in 0...toDoList.count-1 {
            if toDoList[i].status == "완료" { // 완료 항목만을 출력
                if toDoList[i].name.count > 15 {
                    let maxString = toDoList[i].name.prefix(15)
                    toDoList[i].name = maxString + "..."
                }

                print("\(i) | \(toDoList[i].koreaDate) | [\(toDoList[i].status)] \(toDoList[i].name) ")
                count+=1 // 완료 항목 체크 변수 1씩 증가
            }
        }

        if count == 0 { // 완료된 항목이 없을 때
            print("완료된 To-do가 존재하지 않습니다.")
        }
        else if count > 0 { // 완료된 항목이 1개 이상일 때

            let percent = (100.0 / Double(toDoList.count)) * Double(count)
            let res = String(format: "%.2f",percent) // 소수점 2자리 까지

            print("전체 할 일 중 \(res)% 완료했습니다")
        }

    }

}

func fileFetch() { // toDoList의 정보를 가져오는 함수 <도전 과제>
    // 이전에 저장한 데이터를 UserDefaults에서 불러와서 toDoList 배열로 복원
    if let todoData = UserDefaults.standard.data(forKey:"toDoList"),
           let todoloaded = try? JSONDecoder().decode([toDo].self, from: todoData) {
            toDoList = todoloaded
        }
}

func fileStore() { // toDoList의 정보를 저장하는 함수 <도전 과제>
    // 프로그램이 종료되기 전에 현재의 toDoList 배열을 UserDefaults에 저장
    if let todoStore = try? JSONEncoder().encode(toDoList){
        UserDefaults.standard.set(todoStore, forKey: "toDoList")
    }
}

func printInfo() { // 화면 정보를 출력하는 함수
    print("[원하는 기능을 입력해주세요.]")
    print("1: 할 일 추가, 2: 할 일 삭제, 3: 할 일 내용수정, 4: 할 일 상태변경, 5: 전체 할 일 목록, 6: 완료된 할 일 목록, X: 종료 ")
}
