//
//  RecipeCell.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 07.07.2022.
//

import UIKit

class RecipeCell: UICollectionViewCell {
    
    static let reuseID = "RecipeCell"
    
    let image = UIImageView(image: UIImage(named: "bg"))
    let titleLabel = UILabel(text: "Name recipe", font: UIFont(name: "AvenirNext-Bold", size: 20)!, isDark: false)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
            
        addSubview(image)
        addSubview(titleLabel)
        
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 14
        titleLabel.backgroundColor = UIColor(named: "blackAlpha")
        
        
        image.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 3
        layer.shadowOpacity = 1
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
