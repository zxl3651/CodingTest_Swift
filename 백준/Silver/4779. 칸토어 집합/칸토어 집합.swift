import Foundation

func div_line(_ num: Int) -> String{
    if num == 0 || num == 1{
        return "-"
    } else{
        return div_line(num / 3) + String(repeating: " ", count: num / 3) + div_line(num / 3)
    }
}

while let input = readLine(){
    print(div_line(Int(pow(3.0, Double(input)!))))
}