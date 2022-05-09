//
//  HomePresenter.swift
//  upax-viper
//
//  Created by Jossue Betancourt on 07/05/22.
//

import Foundation
import UIKit

class HomePresenter: ViewToPresenterProtocol{
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    private var currentPage = 1
    private var lastPage = 1
    var query: String? = ""

    func fetch() {
       
        interactor?.fetch(page: self.currentPage, query: self.query!)
        self.debug()
    }
    
    func fetchNext() {
        currentPage = currentPage + 1
        if !isLastPage(){
            fetch()
        }else{
            //view?.fail()
        }
    }

    func refresh() {
        currentPage = 1
        fetch()
    }

    func isFirstPage() -> Bool {
        return currentPage == 1
    }

    func isLastPage() -> Bool {
        return currentPage == lastPage
    }
    
    func debug(){
        print("currentPage: \(currentPage)  lastPage: \(lastPage)")
    }
}

extension HomePresenter: InteractorToPresenterProtocol{
    func FetchedSuccess(lst_photos: [Photo], total_pages: Int) {
        lastPage = total_pages
        
        view?.show(DataArray: lst_photos)
    }
    
    func FetchFailed() {
        view?.fail()
    }
    
    
}

