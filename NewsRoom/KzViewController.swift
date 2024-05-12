//
//  UIViewController.swift
//  NewsRoom
//
//  Created by Мухит Молдир on 05.05.2024.
//

import UIKit

class KzViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    var timer: Timer?
    var viewData = [SearchNewsArticles]()
    
  lazy var searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchNews(searchText: "KZ")
        definesPresentationContext = false
      navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        
    searchController.searchBar.placeholder = "Search application"
        searchController.searchBar.delegate = self
  searchController.definesPresentationContext = false
     searchController.obscuresBackgroundDuringPresentation = false
        
        collectionView.backgroundColor = .white
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    fileprivate func searchNews(searchText: String) {
        Service.shared.searchApp(searchTerm: searchText) { (res, err) in
            
            if let err = err {
                print("Failed to fetch apps:" , err)
                return
            }
            
            self.viewData = res?.articles ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchtext:\(searchText)")
        
        timer?.invalidate()
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            
            self.searchNews(searchText: searchText)
        })
        
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! AppRowCell
        cell.configure(viewData[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width - 15, height: 70)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        
        
        let appData = viewData[ indexPath.item]
        let vc = AppDetailController(result: appData)
        
        self.navigationController?.pushViewController(vc,animated:true)
    }
    
    
    
    
    
}

