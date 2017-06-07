//
//  Configuration.swift
//  Yawp
//
//  Created by Paul Schifferer on 4/4/17.
//  Copyright © 2017 Pilgrimage Software. All rights reserved.
//

import Foundation


public struct Configuration {
    public let mediaEndpoint : URL
}


extension Configuration : Serializable {
    
    public init?(from dict : JSONDictionary) {
        guard let u = dict["media-endpoint"] as? String,
            let mediaEndpoint = URL(string: u)
            else { return nil }
        
        self.mediaEndpoint = mediaEndpoint
    }
    
    public func toDictionary() -> JSONDictionary {
        let dict : JSONDictionary = [
            "media-endpoint" : mediaEndpoint.absoluteString,
            ]
        return dict
    }
    
}
