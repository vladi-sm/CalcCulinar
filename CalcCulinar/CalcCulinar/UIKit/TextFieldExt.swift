//
//  TextFieldExt.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 28.06.2022.
//

import UIKit

extension UITextField {
    
    convenience init(_ placeholder: String) {
        self.init(frame: CGRect())
        
        backgroundColor = .white
        self.placeholder = placeholder
        layer.cornerRadius = 12
        font = UIFont(name: "AvenirNext-Bold", size: 18)
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        leftViewMode = .always
    }
    
}
