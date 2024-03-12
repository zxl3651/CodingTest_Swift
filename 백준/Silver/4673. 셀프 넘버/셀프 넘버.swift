import Foundation

var selfNumber = [Bool](repeating: true, count: 10001)
// 셀프 넘버를 제외한 값 false
for i in 1...10000 {
    if selfNumber[i] == true {
        var num = i
        while num < 10000 {
            var arr = Array(String(num)).map{String($0)}
            // 다 더한 값을 만듬
            let result = arr.map{ Int($0)! }.reduce(0, +) + num
            if result >= 10000 {
                break
            } else {
                // 해당 숫자 false로 바꾸고
                selfNumber[result] = false
                num = result
            }
        }
    }
}

// 1부터 10000까지 숫자 증가
for i in 1..<10000 {
    if selfNumber[i] == true {
        print(i)
    }
}
