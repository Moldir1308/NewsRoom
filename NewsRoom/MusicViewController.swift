//
//  File.swift
//  NewsRoom
//
//  Created by Мухит Молдир on 28.04.2024.
//

import UIKit

class MusicViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var feedModel = [SearchNewsArticles]()
    
    var cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        fetchData()
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func fetchData() {
        Service.shared.getMusics() { (res, err) in
            
            if let err = err {
                print("Failed to fetch apps:", err)
                return
            }
            
            self.feedModel = res?.articles ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension MusicViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return feedModel.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppRowCell
        cell.configure(feedModel[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width - 20, height: 90)
    }
}
    
        
