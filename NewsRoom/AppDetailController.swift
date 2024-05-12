//
//  AppDetailController.swift
//  NewsRoom
//
//  Created by Мухит Молдир on 28.04.2024.
//

import UIKit

class AppDetailController: UIViewController {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Варвара Кошечкина"
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "images")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.text = "Казахстан опроверг причастность к атакам на Татарстан"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrowshape.left")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        // Set up your favorite button here
        return button
    }()
    
    var result: SearchNewsArticles
    init(result: SearchNewsArticles) {
        self.result = result
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nameLabel.text = result.author //"Варвара Кошечкина"
        descLabel.text = result.description //"Казахстан опроверг причастность к атакам на Татарстан"
//        posterImageView.image = result.artworkUrl100
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: favoriteButton)
        
        backButton.addTarget(self, action: #selector(handleBackPressed), for: .touchUpInside)
        favoriteButton.addTarget(self, action: #selector(handleFavPressed), for: .touchUpInside)
        
        view.backgroundColor = .darkGray
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        
        view.addSubview(posterImageView)
        posterImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        posterImageView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        posterImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        posterImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        view.addSubview(descLabel)
        descLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 40).isActive = true
        descLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        descLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
    }
    
    @objc func handleBackPressed(button: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func handleFavPressed(button: UIButton) {
        // Handle favorite button press
    }
}
