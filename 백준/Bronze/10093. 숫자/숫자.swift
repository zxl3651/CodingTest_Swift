var input = readLine()!.split(separator: " ").map{ Int64($0)! }
var (start, end) = (input[0] > input[1] ? (input[1], input[0]) : (input[0], input[1]) )
var answer: String = ""

if start == end {
    print(end - start)
} else {
    for i in start + 1..<end {
        answer += String(i) + " "
    }
    print(end - start - 1)
    print(answer)
}