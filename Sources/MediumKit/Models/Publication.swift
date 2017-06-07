import Foundation


public struct Publication {
    public let id : String
    public let name : String
    public let desc : String
    public let URL : URL
    public let imageURL : URL
}


extension Publication : Serializable {
    
    public init?(from json : JSONDictionary) {
        guard let id = json["id"] as? String,
            let name = json["name"] as? String,
            let desc = json["description"] as? String,
            let u = json["url"] as? String,
            let url = URL(string: u),
            let i = json["imageUrl"] as? String,
            let imageUrl = URL(string: i)
            else { return nil }
        
        self.id = id
        self.name = name
        self.desc = desc
        self.URL = url
        self.imageURL = imageUrl
    }
    
    public func toDictionary() -> JSONDictionary {
        let dict : JSONDictionary = [
            "id" : id,
            "name" : name,
            "description" : desc,
            "url" : URL.absoluteString,
            "imageUrl" : imageURL.absoluteString,
            ]
        
        return dict
    }
    
}
