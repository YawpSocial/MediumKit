import Foundation


public struct Publications {

    public static func contributors(publicationId : String) -> Request<[Contributor]> {
        let method = HTTPMethod.get(Payload.empty)
        
        return Request<[Contributor]>(path: "/publications/\(publicationId)/contributors", method: method, parse: Request<[Contributor]>.parser)
    }
    
    
}
