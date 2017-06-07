import Foundation


public struct Contributor {
    public let publicationId : String
    public let userId : String
    public let role : String
}


extension Contributor : Serializable {
    
    public init?(from json : JSONDictionary) {
        guard let publicationId = json["publicationId"] as? String,
            let userId = json["userId"] as? String,
            let role = json["role"] as? String
            else { return nil }
        
        self.publicationId = publicationId
        self.userId = userId
        self.role = role
    }
    
    public func toDictionary() -> JSONDictionary {
        let dict : JSONDictionary = [
            "publicationId" : publicationId,
            "userId" : userId,
            "role" : role,
            ]
        
        return dict
    }
    
}
