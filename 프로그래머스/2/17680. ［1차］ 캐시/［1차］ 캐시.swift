func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cache : [String] = []
    var answer = 0
    
    for i in 0..<cities.count {
        let city = cities[i].lowercased()
        if cache.contains(city) { // cache hit
            answer += 1
            cache.remove(at: cache.firstIndex(of: city)!)
            cache.append(city)
        } else {
            answer += 5
            if cacheSize - cache.count > 0 {
                cache.append(city)
            } else {
                if cacheSize == 0{
                    continue
                } else {
                    cache = cache.reversed()
                    cache.removeLast()
                    cache = cache.reversed()
                    cache.append(city)
                }
            }
        }
    }
    return answer
}