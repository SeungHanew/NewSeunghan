import Foundation

// ✅ 클래스 이름 중복 확인 후, "Calculator" 클래스가 하나만 있도록 유지
class Calculator {
    var addOperation: AddOperation
    var subtractOperation: SubtractOperation
    var multiplyOperation: MultiplyOperation
    var divideOperation: DivideOperation
    
    // ✅ 올바른 초기화 함수 (init) 추가
    init(addOperation: AddOperation, subtractOperation: SubtractOperation, multiplyOperation: MultiplyOperation, divideOperation: DivideOperation) {
        self.addOperation = addOperation
        self.subtractOperation = subtractOperation
        self.multiplyOperation = multiplyOperation
        self.divideOperation = divideOperation
    }
}

// ✅ 연산 클래스 정의
class AddOperation {
    func operate(firstNum: Double, secondNum: Double) -> Double {
        return firstNum + secondNum
    }
}

class SubtractOperation {
    func operate(firstNum: Double, secondNum: Double) -> Double {
        return firstNum - secondNum
    }
}

class MultiplyOperation {
    func operate(firstNum: Double, secondNum: Double) -> Double {
        return firstNum * secondNum
    }
}

class DivideOperation {
    func operate(firstNum: Double, secondNum: Double) -> Double {
        return firstNum / secondNum
    }
}

// ✅ 올바르게 객체 생성 (각 연산 클래스 인스턴스 생성)
let addOperation = AddOperation()
let subtractOperation = SubtractOperation()
let multiplyOperation = MultiplyOperation()
let divideOperation = DivideOperation()

// ✅ 생성자 호출 방식 수정 → 오류 해결!
let calculator = Calculator(addOperation: addOperation,
                            subtractOperation: subtractOperation,
                            multiplyOperation: multiplyOperation,
                            divideOperation: divideOperation)

// ✅ 결과 출력 (Xcode Console에서 확인 가능)
print(calculator.addOperation.operate(firstNum: 10, secondNum: 5))   // 15.0
print(calculator.subtractOperation.operate(firstNum: 10, secondNum: 5)) // 5.0
print(calculator.multiplyOperation.operate(firstNum: 10, secondNum: 5)) // 50.0
print(calculator.divideOperation.operate(firstNum: 10, secondNum: 5))   // 2.0
