import Foundation


private let dateFormatter = ISO8601DateFormatter()

public struct User {

}


extension User : Serializable {

    public init?(from dict : JSONDictionary) {

    }

    public func toDictionary() -> JSONDictionary {
        var dict : JSONDictionary = [

            ]

               return dict
    }
    
}
