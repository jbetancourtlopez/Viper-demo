//
//  Photo.swift
//  upax-viper
//
//  Created by Jossue Betancourt on 07/05/22.
//

import Foundation

struct Photo:Codable {
    var description: String?
    var user: User
    
    init(description: String, user: User){
        self.description = description
        self.user = user
    }
}

struct User:Codable{
    
    var name: String?
    var last_name: String
    var profile_image: ProfileImage
    
    init(name: String, last_name:String, profile_image: ProfileImage){
        self.name = name
        self.last_name = last_name
        self.profile_image = profile_image
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
            
        profile_image = try values.decode(ProfileImage.self, forKey: .profile_image)
        
        if let name =  try values.decodeIfPresent(String.self, forKey: .name) {
            self.name = name
        }else {
            self.name = "Sin nombre"
        }
        
        if let last_name =  try values.decodeIfPresent(String.self, forKey: .last_name) {
            self.last_name = last_name
        }else {
            self.last_name = "Sin apellido"
        }

    }
    
}

struct ProfileImage: Codable{
    var small: String
    var medium:String
    var large: String
    
    init (small: String, medium:String, large: String){
        self.small = small
        self.medium = medium
        self.large = large
    }
}
