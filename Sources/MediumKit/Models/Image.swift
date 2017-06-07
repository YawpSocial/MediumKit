import Foundation


public struct Image {
    public let URL : URL
    public let md5 : String
}


extension Image : Serializable {
    
    public init?(from json : JSONDictionary) {
        guard let u = json["url"] as? String,
            let url = URL(string: u),
            let md5 = json["md5"] as? String
            else { return nil }
        
        self.URL = url
        self.md5 = md5
    }
    
    public func toDictionary() -> JSONDictionary {
        let dict : JSONDictionary = [
            "url" : URL.absoluteString,
            "md5" : md5,
            ]
        
        return dict
    }
    
}
