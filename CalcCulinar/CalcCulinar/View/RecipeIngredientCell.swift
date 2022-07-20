//
//  RecipeIngredientCell.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 12.07.2022.
//

import UIKit

class RecipeIngredientCell: UITableViewCell {

    static let reuseID = "RecipeIngredientCell"
    
    let titleLabel = UILabel(text: "Name ingredient", font: UIFont(name: "AvenirNext-Regular", size: 16)!, isDark: true)
    let countLabel = UILabel(text: "45 g", font: UIFont(name: "AvenirNext-Regular", size: 14)!, isDark: true)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let stack = UIStackView(views: [titleLabel, countLabel], axis: .horizontal, spacing: 8)
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
        
    
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
            stack.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            stack.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
