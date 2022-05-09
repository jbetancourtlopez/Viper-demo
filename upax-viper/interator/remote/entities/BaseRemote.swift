//
//  BaseRemote.swift
//  upax-viper
//
//  Created by Jossue Betancourt on 08/05/22.
//

import Foundation

struct BaseRemote:Codable {
    var total: Int
    var total_pages: Int
    var results: [PhotoRemote]
    
    init (total: Int, total_pages: Int, results: [PhotoRemote]){
        self.total = total
        self.total_pages = total_pages
        self.results = results
        
    }
}
