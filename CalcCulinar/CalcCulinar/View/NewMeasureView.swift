//
//  NewMeasureView.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 02.07.2022.
//

import UIKit

class NewMeasureView: UIView {

    let bgImageView = UIImageView(image: UIImage(named: "scalesBackground"))
    let titleLabel = UILabel(text: "Новая мера", font: UIFont(name: "AvenirNext-bold", size: 28)!, isDark: false)
    let measureTitleTextField = UITextField("Единица измерения")
    let coeffTextField = UITextField("Коэффициент")
    let typeControl = UISegmentedControl(items: ["Масса", "Объем"])
    let saveButton = UIButton(title: "Сохранить", bgColor: .systemGreen, fgColor: .white)
    
    init() {
        super.init(frame: CGRect())
        setConstraints()
        setViews()
    }
    
    func setViews() {
        backgroundColor = .white
        bgImageView.contentMode = .scaleAspectFill
        typeControl.backgroundColor = .white
        typeControl.selectedSegmentTintColor = .systemOrange
        typeControl.selectedSegmentIndex = 0
        
    }
    
    func setConstraints() {
        let stack = UIStackView(views: [titleLabel, measureTitleTextField, coeffTextField, typeControl, saveButton], axis: .vertical, spacing: 16)
        
        addSubview(bgImageView)
        addSubview(stack)
        
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.textAlignment = .center
        
        for view in stack.arrangedSubviews {
            view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        
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
