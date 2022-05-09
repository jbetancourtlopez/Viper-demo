//
//  ViewController.swift
//  upax-viper
//
//  Created by Jossue Betancourt on 07/05/22.
//

import UIKit
import Kingfisher


class HomeViewController: BaseViewController {
    
   var presenter:ViewToPresenterProtocol?
       
   @IBOutlet weak var tableView: UITableView!
   @IBOutlet weak var searchBar: UISearchBar!
    
   var lst_photo = [Photo]()
   var scrollActivate:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        HomeRouter.createModule2(view: self)
        
        self.empty_data_tableview(tableView: self.tableView)

    }
}


// MARK: Protocolo
extension HomeViewController: PresenterToViewProtocol{
    
    func show(DataArray: [Photo]) {
       
        scrollActivate = false
        
        if (presenter!.isFirstPage()) {
            self.lst_photo = DataArray
        }else{
            for item in DataArray{
                self.lst_photo.append(item)
            }
        }
      
        
        DispatchQueue.main.async{
            self.hiddenActivityIndicatory()
            self.tableView.reloadData()
            
            if self.lst_photo.count == 0 {
                self.empty_data_tableview(tableView: self.tableView)
            }
        }
    }
    
    func fail() {
        toast(message: "Ocurrio un error")
    }
}

// MARK: TableView
extension HomeViewController:  UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lst_photo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PhotoCell
        
        let item = self.lst_photo[indexPath.row]
        
        cell.name.text = item.user.name
        cell.username.text = item.user.last_name
        cell.descrip.text = item.description
               
        let url = URL(string: item.user.profile_image.small)
        cell.photo!.kf.setImage(with: url, placeholder: UIImage(named: "logo_jb"))
        //cell.photo.loadImage(urlString: item.user.profile_image.small)
        return cell
    }
    
}

// MARK: SearhcBar
extension HomeViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        showActivityIndicatory(uiView: self.view)
        presenter?.query = searchText
        presenter?.refresh()
    }
}

// MARK: Pagination
extension HomeViewController: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height {
            if !scrollActivate {
                self.scrollActivate = true
                presenter?.fetchNext()
            }
        }
    }
}



