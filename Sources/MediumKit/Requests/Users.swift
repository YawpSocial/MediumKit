import Foundation


public struct Users {

    public static func publications(userId : String) -> Request<[Publication]> {
        let method = HTTPMethod.get(Payload.empty)

        return Request<User>(path: "/users/\(userId)", method: method, parse: Request<User>.parser)
    }

}
