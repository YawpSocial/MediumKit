import Foundation


public struct Posts {

    /**
     Create a new post.

     - parameter text: The body of the post. 256 character-limited string.
     - parameter isNSFW: Optional boolean whether the post should be marked as "NSFW" (Not Safe For Work/mature/offensive).
     - parameter replyTo: Optional ID of another post to reply to.
     - parameter raw: An array of `Raw` objects that will be attached to the post.
     - parameter parseLinks: Optional boolean whether the links should be parsed by the server.
     - parameter parseMarkdownLinks: Optional boolean whether the markdown links should be parsed by the server. Default true.
     - parameter updateMarker: Indicates whether the stream marker should be updated to this post.
     */
    public static func create(authorId : String, title : String, format : ContentFormat, content : String,
                              tags : [String]? = nil, canonicalURL : URL? = nil, publishStatus : PublishStatus = .public,
                              license : License = .allRightsReserved, notifyFollowers : Bool = false) -> Request<Post> {
        var json : JSONDictionary = [
            "title" : title,
            "contentFormat" : format.rawValue,
            "content" : content,
            "publishStatus" : publishStatus.rawValue,
            "license" : license.rawValue,
            "notifyFollowers" : notifyFollowers,
        ]

        if let tags = tags {
            json["tags"] = tags
        }
        if let canonicalURL = canonicalURL {
            json["canonicalURL"] = canonicalURL.absoluteString
        }
        let data = try! JSONSerialization.data(withJSONObject: json)
        let method = HTTPMethod.post(Payload.json(data))

        return Request<Post>(path: "/users/\(authorId)/posts", method: method, parse: Request<Post>.parser)
    }

    /**
     Create a new post.

     - parameter text: The body of the post. 256 character-limited string.
     - parameter isNSFW: Optional boolean whether the post should be marked as "NSFW" (Not Safe For Work/mature/offensive).
     - parameter replyTo: Optional ID of another post to reply to.
     - parameter raw: An array of `Raw` objects that will be attached to the post.
     - parameter parseLinks: Optional boolean whether the links should be parsed by the server.
     - parameter parseMarkdownLinks: Optional boolean whether the markdown links should be parsed by the server. Default true.
     - parameter updateMarker: Indicates whether the stream marker should be updated to this post.
     */
    public static func create(publicationId : String, title : String, format : ContentFormat, content : String,
                              tags : [String]? = nil, canonicalURL : URL? = nil, publishStatus : PublishStatus = .public,
                              license : License = .allRightsReserved, notifyFollowers : Bool = false) -> Request<Post> {
        var json : JSONDictionary = [
            "title" : title,
            "contentFormat" : format.rawValue,
            "content" : content,
            "publishStatus" : publishStatus.rawValue,
            "license" : license.rawValue,
            "notifyFollowers" : notifyFollowers,
            ]

        if let tags = tags {
            json["tags"] = tags
        }
        if let canonicalURL = canonicalURL {
            json["canonicalURL"] = canonicalURL.absoluteString
        }
        let data = try! JSONSerialization.data(withJSONObject: json)
        let method = HTTPMethod.post(Payload.data(data))

        return Request<Post>(path: "/publications/\(publicationId)/posts", method: method, parse: Request<Post>.parser)
    }

    public static func get(postId : String, raw : Bool? = nil) -> Request<Post> {
        let parameters = [
            Parameter(name: "include_raw", value: raw.flatMap(trueOrNil)),
            Parameter(name: "include_user_raw", value: raw.flatMap(trueOrNil)),
        ]
        let method = HTTPMethod.get(Payload.parameters(parameters))

        return Request<Post>(path: "/posts/\(postId)", method: method, parse: Request<Post>.parser)
    }

//    public static func edit(postId : String) -> Request<Post> {
//
//    }

    public static func delete(postId : String) -> Request<Post> {
        let method = HTTPMethod.delete

        return Request<Post>(path: "/posts/\(postId)", method: method, parse: Request<Post>.parser)
    }

//    public static func revisions(postId : String) -> Request<[Post]> {
//
//    }

    /**
     Retrieves mentions for a specified user.

     - parameter range: The bounds used when requesting data from Pnut.io.
     - returns: Request for `[Post]`.
     */
    public static func mentions(userId : String, range: RequestRange = .default) -> Request<[Post]> {
        let rangeParameters = range.parameters(limit: between(1, and: 40, fallback: 20))
        let method = HTTPMethod.get(Payload.parameters(rangeParameters))

        return Request<[Post]>(path: "/users/\(userId)/mentions", method: method, parse: Request<[Post]>.parser)
    }

    /**
     Retrieves posts by a specified user.

     - parameter range: The bounds used when requesting data from Pnut.io.
     - returns: Request for `[Post]`.
     */
    public static func posts(userId : String, range: RequestRange = .default) -> Request<[Post]> {
        let rangeParameters = range.parameters(limit: between(1, and: 40, fallback: 20))
        let method = HTTPMethod.get(Payload.parameters(rangeParameters))

        return Request<[Post]>(path: "/users/\(userId)/posts", method: method, parse: Request<[Post]>.parser)
    }

    /**
     Retrieves posts by a specified user.

     - parameter range: The bounds used when requesting data from Pnut.io.
     - returns: Request for `[Post]`.
     */
    public static func tagged(tag : String, range: RequestRange = .default) -> Request<[Post]> {
        let rangeParameters = range.parameters(limit: between(1, and: 40, fallback: 20))
        let method = HTTPMethod.get(Payload.parameters(rangeParameters))

        return Request<[Post]>(path: "/posts/tag/\(tag)", method: method, parse: Request<[Post]>.parser)
    }

    //    public static func actions(postId : String) -> Request<[Action]> {
    //
    //    }

    public static func bookmark(postId : String) -> Request<Post> {
        let method = HTTPMethod.put(Payload.empty)

        return Request<Post>(path: "/posts/\(postId)/bookmark", method: method, parse: Request<Post>.parser)
    }

    public static func unbookmark(postId : String) -> Request<Post> {
        let method = HTTPMethod.delete

        return Request<Post>(path: "/posts/\(postId)/bookmark", method: method, parse: Request<Post>.parser)
    }

    public static func repost(postId : String) -> Request<Post> {
        let method = HTTPMethod.put(Payload.empty)

        return Request<Post>(path: "/posts/\(postId)/repost", method: method, parse: Request<Post>.parser)
    }

    public static func unrepost(postId : String) -> Request<Post> {
        let method = HTTPMethod.delete

        return Request<Post>(path: "/posts/\(postId)/repost", method: method, parse: Request<Post>.parser)
    }

    public static func thread(postId : String) -> Request<[Post]> {
        let method = HTTPMethod.get(Payload.empty)
        
        return Request<[Post]>(path: "/posts/\(postId)/thread", method: method, parse: Request<[Post]>.parser)
    }
    
    
}
