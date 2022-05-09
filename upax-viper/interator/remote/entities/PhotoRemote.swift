//
//  PhotoRemote.swift
//  upax-viper
//
//  Created by Jossue Betancourt on 07/05/22.
//

import Foundation


struct PhotoRemote:Codable {
    var description: String?
    var user: UserRemote
}

struct UserRemote:Codable{
    
    var name: String?
    var last_name: String
    var profile_image: ProfileImageRemote
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
            
        profile_image = try values.decode(ProfileImageRemote.self, forKey: .profile_image)
        
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

struct ProfileImageRemote: Codable{
    var small: String
    var medium:String
    var large: String
}

