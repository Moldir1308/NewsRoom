//
//  TabBarController.swift
//  NewsRoom
//
//  Created by Мухит Молдир on 28.04.2024.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            createController(viewController: MainViewController(collectionViewLayout: UICollectionViewFlowLayout()), title: "Новости", imageName: "newspaper"),
        createController(viewController: SearchController(collectionViewLayout: UICollectionViewFlowLayout()), title: "Поиск", imageName: "search-2"),
        createController(viewController: KzViewController(collectionViewLayout: UICollectionViewFlowLayout()), title: "Казахстан", imageName: "kazakhstan-2")]
    }

    func createController(viewController:UIViewController,title:String,imageName:String) ->UIViewController{
        let navController = UINavigationController(rootViewController:viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named:imageName)
        
        return navController
    }

}


