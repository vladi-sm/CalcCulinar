//
//  CustomTextField.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 05.07.2022.
//

import UIKit

class CustomTextField: UIView {

    let tf = UITextField("")
    let errorlabel = UILabel(text: "", font: UIFont(name: "AvenirNext-regular", size: 12)!, isDark: true)

    init(placeholder: String) {
        super.init(frame: CGRect())
        self.tf.placeholder = placeholder
        self.errorlabel.tintColor = .red
        self.errorlabel.textColor = .red
//        self.errorlabel.isHidden = true
        
        let stack = UIStackView(views: [errorlabel, tf], axis: .vertical, spacing: 2)
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.leftAnchor.constraint(equalTo: leftAnchor),
            stack.rightAnchor.constraint(equalTo: rightAnchor),
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func showError(message: String) {
        self.errorlabel.text = message
//        self.errorlabel.isHidden = false
    }
    
    func clearError() {
        self.errorlabel.text?.removeAll()
        self.errorlabel.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
