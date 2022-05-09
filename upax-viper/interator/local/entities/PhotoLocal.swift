//
//  PhotoLocal.swift
//  upax-viper
//
//  Created by Jossue Betancourt on 07/05/22.
//

import Foundation

struct PhotoLocal:Codable {
    var description: String
    var user: user
    
    struct user:Codable{
        var name: String
        var username: String
        var profile_image: profile_image
    }
    
    struct profile_image: Codable{
        var small: String
        var medium:String
        var large: String
    }
}
