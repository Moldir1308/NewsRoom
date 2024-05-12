//
//  ScreenCell.swift
//  NewsRoom
//
//  Created by Мухит Молдир on 28.04.2024.
//

import UIKit

class ScreenCell: UICollectionViewCell {
    
    lazy var previewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        addSubview(previewImageView)
        
        NSLayoutConstraint.activate([
            previewImageView.topAnchor.constraint(equalTo: topAnchor),
            previewImageView.leftAnchor.constraint(equalTo: leftAnchor),
            previewImageView.rightAnchor.constraint(equalTo: rightAnchor),
            previewImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    
    func configure(_ imageURL: String?) {
        previewImageView.downloaded(from: imageURL ?? "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

