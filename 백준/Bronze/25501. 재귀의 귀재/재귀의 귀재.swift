func recursion(_ arr: [Character],_ start: Int,_ end: Int) -> Int{
    if (start >= end){
        return 1
    } else if (arr[start] != arr[end]){
        return 0
    } else {
        cnt += 1
        return recursion(arr, start+1, end-1)
    }
}

func isPalindrome(_ arr: [Character]) -> Int{
    return recursion(arr, 0, arr.count - 1)
}

var cnt = 1
let N = Int(readLine()!)!
for _ in 0..<N{
    cnt = 1
    let S = Array(readLine()!)
    print("\(isPalindrome(S)) \(cnt)")
}