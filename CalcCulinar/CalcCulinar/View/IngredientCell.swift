//
//  IngredientCell.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 03.07.2022.
//

import UIKit

class IngredientCell: UITableViewCell {
    
    static let reuseID: String = "IngredientCell"
    
    let titleLabel = UILabel(text: "Название", font: UIFont(name: "AvenirNext-bold", size: 16)!, isDark: false)
    let measureLabel = UILabel(text: "Мера", font: UIFont(name: "AvenirNext-bold", size: 16)!, isDark: false)
    let quantityLabel = UILabel(text: "4500", font: UIFont(name: "AvenirNext-bold", size: 16)!, isDark: false)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    func setConstraints() {
        let stack = UIStackView(views: [titleLabel, quantityLabel, measureLabel], axis: .horizontal, spacing: 12)
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
            stack.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            quantityLabel.widthAnchor.constraint(equalToConstant: 100),
            measureLabel.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
