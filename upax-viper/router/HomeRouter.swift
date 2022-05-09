//
//  HomeRouter.swift
//  upax-viper
//
//  Created by Jossue Betancourt on 07/05/22.
//

import Foundation
import UIKit


class HomeRouter:PresenterToRouterProtocol{
    
    static func createModule() -> HomeViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = HomePresenter()
        let interactor: PresenterToInteractorProtocol = HomeInteractor()
        let router:PresenterToRouterProtocol = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func pushToMovieScreen(navigationConroller navigationController:UINavigationController) {
        let module = HomeRouter.createModule()
        navigationController.pushViewController(module,animated: true)
    }
    
    class func createModule2(view: HomeViewController) {
       
            let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = HomePresenter()
            let interactor: PresenterToInteractorProtocol = HomeInteractor()
            let router:PresenterToRouterProtocol = HomeRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
    }
    
}
