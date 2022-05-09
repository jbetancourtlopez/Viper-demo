//
//  PhotoRemoteMapper.swift
//  upax-viper
//
//  Created by Jossue Betancourt on 08/05/22.
//

import Foundation

class PhotoRemotoMapper{
    
    func mapRemotoToEntity(photoRemote: PhotoRemote) -> Photo {
        
        var profile_image = ProfileImage(small: photoRemote.user.profile_image.small, medium: photoRemote.user.profile_image.medium, large: photoRemote.user.profile_image.large)
        var user = User(name: photoRemote.user.name!, last_name: photoRemote.user.last_name, profile_image: profile_image)
        
        var description: String = "No hay descripción"
        
        if (photoRemote.description != nil) {
            description = photoRemote.description!
        }
        
        let photo = Photo(description: description, user: user)
        return photo
    }
}
