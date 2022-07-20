//
//  RecipeView.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 07.07.2022.
//

import UIKit

class RecipeView: UIView {
    
    let recipeImage = UIImageView(image: UIImage(named: "recipeBG"))
    var recipeTitleLabel = UILabel(text: "Название рецепта", font: UIFont(name: "AvenirNext-bold", size: 18)!, isDark: false)
    let ingredientsTitleLabel = UILabel(text: "  Ингредиенты:", font: UIFont(name: "AvenirNext-bold", size: 16)!, isDark: false)
    let tableView = UITableView()
    let descriptionTextView = UITextView()
    
    init() {
        super.init(frame: CGRect())
        setViews()
        setConstraints()
    }
    
    func setViews(){
        backgroundColor = .white
        tableView.register(RecipeIngredientCell.self, forCellReuseIdentifier: RecipeIngredientCell.reuseID)
        tableView.backgroundColor = .white
        recipeImage.contentMode = .scaleAspectFill
        recipeImage.layer.cornerRadius = 16
        
    }
    
    func setConstraints(){
        
        recipeImage.addSubview(recipeTitleLabel)
        
        let stack = UIStackView(views: [recipeImage,
                                        ingredientsTitleLabel,
                                        tableView,
                                        descriptionTextView],
                                axis: .vertical, spacing: 8)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
    
        recipeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.bottomAnchor.constraint(equalTo:  bottomAnchor),
            stack.leftAnchor.constraint(equalTo: leftAnchor),
            stack.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            recipeImage.heightAnchor.constraint(equalToConstant:  200)
        ])
        
        NSLayoutConstraint.activate([
            recipeTitleLabel.leftAnchor.constraint(equalTo: recipeImage.leftAnchor, constant: 8),
            recipeTitleLabel.bottomAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            tableView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
