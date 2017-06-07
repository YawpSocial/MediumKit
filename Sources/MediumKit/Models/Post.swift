import Foundation


public struct Post {
    public let id : String
    public let title : String
    public let authorId : String
    public let tags : [String]?
    public let url : URL
    public let canonicalURL : URL
    public let publishStatus : PublishStatus
    public let publishedAt : Date
    public let license : License
    public let licenseURL : URL 
}


extension Post : Serializable {
    
    public init?(from json : JSONDictionary) {
        guard let id = json["id"] as? String,
            let title = json["title"] as? String,
            let authorId = json["authorId"] as? String,
            let u = json["url"] as? String,
            let url = URL(string: u),
            let c = json["canonicalUrl"] as? String,
            let canonicalUrl = URL(string: c),
            let p = json["publishStatus"] as? String,
            let publishStatus = PublishStatus(rawValue: p),
            let publishedAt = json["publishedAt"] as? TimeInterval,
            let l = json["license"] as? String,
            let license = License(rawValue: l),
            let lu = json["licenseUrl"] as? String,
            let licenseUrl = URL(string: lu)
            else { return nil }
        
        self.id = id
        self.title = title
        self.authorId = authorId
        self.tags = json["tags"] as? [String]
        self.url = url
        self.canonicalURL = canonicalUrl
        self.publishStatus = publishStatus
        self.publishedAt = Date(timeIntervalSince1970: publishedAt)
        self.license = license
        self.licenseURL = licenseUrl
    }
    
    public func toDictionary() -> JSONDictionary {
        var dict : JSONDictionary = [
            "id" : id,
            "title" : title,
            "authorId" : authorId,
            "url" : url.absoluteString,
            "canonicalUrl" : canonicalURL.absoluteString,
            "publishStatus" : publishStatus.rawValue,
            "publishedAt" : publishedAt.timeIntervalSince1970,
            "license" : license.rawValue,
            "licenseUrl" : licenseURL.absoluteString,
            ]
        
        if let tags = self.tags {
            dict["tags"] = tags
        }
        
        return dict
    }
    
}
