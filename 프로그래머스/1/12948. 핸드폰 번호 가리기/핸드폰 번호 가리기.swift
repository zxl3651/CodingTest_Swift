func solution(_ phone_number:String) -> String {
    var star = String(repeating: "*", count:phone_number.count - 4)
    return "\(star)\(phone_number.suffix(4))"
}