//
//  CalcView.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 28.06.2022.
//

import UIKit

class CalcView: UIView {

    let bgImageView = UIImageView(image: UIImage(named: "foodBackground"))
    let inputValueTF = UITextField("Введите количество")
    let inputMeasureTF = UITextField("Мера")
    let outMeasureTF = UITextField("Мера")
    let ingredientTF = UITextField("Ингридиент")
    let outValueLabel = UILabel(text: "0.00", font: UIFont(name: "AvenirNext-bold", size: 18)!, isDark: false)
    let solveButton = UIButton(title: "Посчитать", bgColor: .systemGreen, fgColor: .white)
    let memoryButton = UIButton(title: "Запомнить", bgColor: .systemYellow, fgColor: .black)
    
    let tableView = UITableView()
    
    let plusButton = UIButton(title: "", bgColor: .systemOrange, fgColor: .white)
    
    
    
    let inMeasurePicker = UIPickerView()
    let outMeasurePicker = UIPickerView()
    let ingredientPicker = UIPickerView()
    
    init() {
        super.init(frame: CGRect())
        setConstraints()
        setViews()
      
    }
    
    //установка внешнего вида
    func setViews(){
        backgroundColor = .white
        bgImageView.contentMode = .scaleAspectFill
        inputValueTF.keyboardType = .decimalPad
        plusButton.layer.cornerRadius = 30
        plusButton.clipsToBounds = true
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        inputMeasureTF.inputView = inMeasurePicker
        outMeasureTF.inputView = outMeasurePicker
        ingredientTF.inputView = ingredientPicker
        outValueLabel.layer.cornerRadius = 16
        outValueLabel.backgroundColor = UIColor(named: "blackAlpha")
        tableView.backgroundColor = UIColor(named: "blackAlpha")
        tableView.layer.cornerRadius = 16
        tableView.register(IngredientCell.self, forCellReuseIdentifier: IngredientCell.reuseID)
        
    }
    
    //установка взаимных положений элементов
    func setConstraints(){
        //1 добавить view как subview на другую view
        
        addSubview(bgImageView)
        addSubview(tableView)
        addSubview(plusButton)
             
        let inStack = UIStackView(views: [inputValueTF,inputMeasureTF], axis: .horizontal, spacing: 16)
        let outStack = UIStackView(views: [outValueLabel, outMeasureTF], axis: .horizontal, spacing: 16)
        let stack = UIStackView(views: [inStack, outStack, ingredientTF, solveButton, memoryButton], axis: .vertical, spacing: 16)
        addSubview(stack)
        
        //2 отключить маску autoresizing
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        //3 закрепить констрейнтами
        
        for view in stack.arrangedSubviews {
            view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 12),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            inputMeasureTF.widthAnchor.constraint(equalToConstant: 90),
            outMeasureTF.widthAnchor.constraint(equalToConstant: 90)
        ])
        
        NSLayoutConstraint.activate([
            plusButton.heightAnchor.constraint(equalToConstant: 60),
            plusButton.widthAnchor.constraint(equalToConstant: 60),
            plusButton.rightAnchor.constraint(equalTo: rightAnchor,constant: -18),
            plusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24)
        ])
        
        NSLayoutConstraint.activate([
            bgImageView.topAnchor.constraint(equalTo: self.topAnchor),
            bgImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bgImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            bgImageView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


