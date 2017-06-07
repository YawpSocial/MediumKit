import Foundation


public struct Users {

    public static func me() -> Request<User> {
        let method = HTTPMethod.get(Payload.empty)

        return Request<User>(path: "/users/me", method: method, parse: Request<User>.parser)
    }

    public static func publications(userId : String) -> Request<[Publication]> {
        let method = HTTPMethod.get(Payload.empty)

        return Request<User>(path: "/users/\(userId)/publications", method: method, parse: Request<User>.parser)
    }

}
