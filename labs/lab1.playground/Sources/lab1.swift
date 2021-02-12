import Foundation

// LECTURE SLIDES: https://docs.google.com/presentation/d/1pktOCUQMPg1ZluVVNZtxQdrTnLZZVhjAXuj1EQvRfQc/edit#slide=id.g62673eb36a_0_89


public class Lab1 {
    public init() {}
    
    //MARK:- PROBLEM 1
    
    // Use string interpolation to print "*album* was released in *year*"
    
    // Slide 14 of the lecture slides could be helpful if you get stuck
    
    // getAlbumRelease("Purple Rain", 1984) -> "Purple Rain was released in 1984
    
    public func getAlbumRelease(_ album: String, _ year: Int) -> String {
        return "\(album) was released in \(year)" // REPLACE THIS LINE
    }
    
    
    //MARK:- PROBLEM 2
    
    // digits should return an an array containing the digits of n in order
    
    // The modulo (%) operator might be helpful
    
    // digits(123) -> [1, 2, 3]
    // digits(0) -> [0]
    
    public func digits(_ n: Int) -> [Int] {
        return [] // REPLACE THIS LINE
    }
    
    
    //MARK:- PROBLEM 3
    
    // if 'key' is a valid key in dict, inDict should return the corresponding value
    // if 'key' is not a valid key in dict, inDict should return "None"
    
    // Remember to use 'if let' to unwrap optional values
    
    // inDict(1, [1 : "Test"]) -> "Test"
    // inDict(2, [1 : "Test"]) -> "None"
    
    
    public func inDict(_ key: Int, _ dict: [Int: String]) -> String {
        return "None" // REPLACE THIS LINE
    }
    
    
}
