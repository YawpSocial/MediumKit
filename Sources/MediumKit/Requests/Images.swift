import Foundation


public struct Images {

    public static func upload(image : MediaAttachment) -> Request<Image> {
let method = HTTPMethod.post(Payload.data(image.mimeType, image.data))

        return Request<Image>(path: "/images", method: method, parse: Request<Image>.parser)
    }

}
