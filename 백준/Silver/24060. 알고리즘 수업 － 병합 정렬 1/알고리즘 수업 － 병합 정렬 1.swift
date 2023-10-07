func merge_sort(_ arr: inout [Int],_ p: Int,_ r: Int){
    var q = 0
    if p < r {
        q = (p + r) / 2
        merge_sort(&arr, p, q)
        merge_sort(&arr, q+1, r)
        merge(&arr, p, q, r)
    }
}

func merge(_ arr: inout [Int],_ p: Int,_ q: Int,_ r: Int){
    var i = p
    var j = q + 1
    var t = 0
    while(i <= q && j <= r){
        if(arr[i] <= arr[j]){
            tmp[t] = arr[i]
            i += 1
        } else {
            tmp[t] = arr[j]
            j += 1
        }
        t += 1
    }
    while(i <= q){
        tmp[t] = arr[i]
        t += 1
        i += 1
    }
    while(j <= r){
        tmp[t] = arr[j]
        t += 1
        j += 1
    }
    i = p
    t = 0
    while(i <= r){
        cnt += 1
        if cnt == K{
            answer = tmp[t]
            break
        }
        arr[i] = tmp[t]
        i += 1
        t += 1
    }
}

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (N, K) = (input[0], input[1])
var cnt = 0
var answer = -1
var tmp = Array(repeating: 0, count: N)
var A = readLine()!.split(separator: " ").map{ Int($0)! }
merge_sort(&A, 0, A.count-1)
print(answer)
