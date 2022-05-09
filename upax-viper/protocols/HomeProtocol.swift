//
//  HomeProtocol.swift
//  upax-viper
//
//  Created by Jossue Betancourt on 07/05/22.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: AnyObject{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    var query: String? {get set}

    func fetch()
    func fetchNext()
    func refresh()
    func isFirstPage() -> Bool
   


    
}

protocol PresenterToViewProtocol: AnyObject{
    func show(DataArray:Array<Photo>)
    func fail()
}

protocol PresenterToRouterProtocol: AnyObject {
    static func createModule()-> HomeViewController
    func pushToMovieScreen(navigationConroller:UINavigationController)
}

protocol PresenterToInteractorProtocol: AnyObject {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetch(page:Int, query: String)
}

protocol InteractorToPresenterProtocol: AnyObject {
    func FetchedSuccess(lst_photos: [Photo], total_pages: Int)
    func FetchFailed()
}
