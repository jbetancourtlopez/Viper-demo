//
//  HomeService.swift
//  upax-viper
//
//  Created by Jossue Betancourt on 08/05/22.
//

import Foundation

class HomeService{
    
        
    func searchPhoto(page: Int, query: String, completionHandler: @escaping (BaseRemote?, _ msg: String) -> Void) {
      
        let url_string = "\(API)search/photos?page=\(page)&per_page=\(PER_PAGE)&query=\(query)&client_id=\(ACCESS_KEY)"
        guard let url = URL(string: url_string) else { return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request){ [weak self] data, _, error in
            
            guard let data = data, error == nil else {
                completionHandler(nil, error!.localizedDescription)
                return
            }
            
            do {
                let response = try JSONDecoder().decode(BaseRemote.self, from: data)
                completionHandler(response, "")
                
            } catch let error {
                let mBaseRemote = BaseRemote(total: 0, total_pages: 0, results: [])
                completionHandler(mBaseRemote, "")
                return
            }
        }
        
        task.resume()
    }
    
    
}
