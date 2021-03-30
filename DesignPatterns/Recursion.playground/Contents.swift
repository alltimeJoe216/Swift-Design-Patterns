func increment(index: Int) -> Int {
    
    var counter = index
    counter += 1
    
    if counter < 100 {
        print(counter)
        return increment(index: counter)
    } else {
        
        return counter
    }
    
}
