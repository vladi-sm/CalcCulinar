//
//  NewIngredientController.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 05.07.2022.
//

import UIKit

class NewIngredientView: UIView {

    let bgImageView = UIImageView(image: UIImage(named: "newIngredientBackground"))
    let titleLabel = UILabel(text: "Новый ингредиент", font: UIFont(name: "AvenirNext-bold", size: 20)!, isDark: false)
    let ingredientTitleTF = CustomTextField(placeholder: "Наименование ингредиента")
    let densityTF = CustomTextField(placeholder: "Плотность, кг/м3")
    let saveButton = UIButton(title: "Сохранить", bgColor: .systemGreen, fgColor: .white)
    
    init() {
        super.init(frame: CGRect())
        setViews()
        setConstraints()
    }
    
    func setViews() {
        self.backgroundColor = .white
        titleLabel.textAlignment = .center
        densityTF.tf.keyboardType = .decimalPad
        bgImageView.contentMode = .scaleAspectFill
    }
    
    func setConstraints() {
        let stack = UIStackView(views: [titleLabel, ingredientTitleTF, densityTF, saveButton ], axis: .vertical, spacing: 20)
        
        addSubview(bgImageView)
        addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bgImageView.topAnchor.constraint(equalTo: self.topAnchor),
            bgImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bgImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            bgImageView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stack.leftAnchor.constraint(equalTo: leftAnchor, constant:  30),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
//            ingredientTitleTF.heightAnchor.constraint(equalToConstant: 40),
//            densityTF.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
