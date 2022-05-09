//
//  HomeInteractor.swift
//  upax-viper
//
//  Created by Jossue Betancourt on 07/05/22.
//

import Foundation
import Alamofire


class HomeInteractor: PresenterToInteractorProtocol{
    
    var presenter: InteractorToPresenterProtocol?
        
    func fetch(page: Int, query: String) {
        
        let service: HomeService = HomeService()
        
        service.searchPhoto(page: page, query: query) { (response, msg) in
            
            if(msg == ""){
                var mapper = PhotoRemotoMapper()
                var lst_photo: [Photo] = []
                for item in response!.results{
                    lst_photo.append(mapper.mapRemotoToEntity(photoRemote: item))
                }

                self.presenter?.FetchedSuccess(lst_photos: lst_photo, total_pages: response!.total_pages)
                
            }else{
                self.presenter?.FetchFailed()
            }
        }
        
    
    }
    
    
}
