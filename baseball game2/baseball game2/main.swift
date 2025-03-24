struct BaseballGame {
    func start() {
        let answer = makeAnswer()
        var isCorrect = false
        
        print("Number BaseBall Game 시작!")
        print("서로 다른 1~9 사이의 숫자 3개를 입력하세요.")
        
        print("정답 (확인용): \(answer)") // 디버깅용
        
        while !isCorrect {
            let userInput = valueInput()
            
            if valueComparison(answer, userInput) {
                print("정답! 게임 종료!")
                isCorrect = true
            }
        }
    }
    
    // MARK: - 사용자 입력 처리
    func valueInput() -> [Int] {
        while true {
            print("입력: ", terminator: "")
            if let input = readLine(), input.allSatisfy({ $0.isNumber }) {
                let inputAns = input.map { Int(String($0))! }
                
                if inputAns.count != 3 {
                    print("❗️ 3자리 숫자를 입력해주세요.")
                    continue
                }
                if Set(inputAns).count != 3 {
                    print("❗️ 서로 다른 숫자를 입력해주세요.")
                    continue
                }
                if inputAns.contains(0) {
                    print("❗️ 0은 사용할 수 없습니다.")
                    continue
                }
                return inputAns
            } else {
                print("❗️ 숫자만 입력해주세요.")
            }
        }
    }
    
    // MARK: - 스트라이크/볼 판정
    func valueComparison(_ answer: [Int], _ input: [Int]) -> Bool {
        var strike = 0
        var ball = 0
        
        for i in 0..<3 {
            if answer[i] == input[i] {
                strike += 1
            } else if answer.contains(input[i]) {
                ball += 1
            }
        }
        
        if strike == 0 && ball == 0 {
            print("Nothing")
        } else {
            print("\(ball) Ball, \(strike) Strike")
        }
        
        return strike == 3
    }
    
    // MARK: - 정답 생성
    func makeAnswer() -> [Int] {
        var numbers = Array(1...9)
        var answer: [Int] = []
        
        while answer.count < 3 {
            let randomIndex = Int.random(in: 0..<numbers.count)
            let num = numbers.remove(at: randomIndex)
            answer.append(num)
        }
        return answer
    }
}

// 실행 부분은 main.swift에 작성해야 한다!
let game = BaseballGame()
game.start()
