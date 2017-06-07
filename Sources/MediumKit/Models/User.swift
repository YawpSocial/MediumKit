import Foundation


private let dateFormatter = ISO8601DateFormatter()

public struct User {
    public let id : String
    public let username : String
    public let name : String
    public let url : URL
    public let imageURL : URL
}


extension User : Serializable {

    public init?(from json : JSONDictionary) {
        guard let id = json["id"] as? String,
            let username = json["username"] as? String,
            let name = json["name"] as? String,
            let u = json["url"] as? String,
            let url = URL(string: u),
            let i = json["imageUrl"] as? String,
            let imageUrl = URL(string: i)
            else { return nil }

        self.id = id
        self.username = username
        self.name = name
        self.url = url
        self.imageURL = imageUrl
    }

    public func toDictionary() -> JSONDictionary {
        let dict : JSONDictionary = [
            "id" : id,
            "username" : username,
            "name" : name,
            "url" : url.absoluteString,
            "imageUrl" : imageURL.absoluteString,
            ]
        
        return dict
    }
    
}
