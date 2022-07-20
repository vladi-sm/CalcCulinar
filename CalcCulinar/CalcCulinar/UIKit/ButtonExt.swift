//
//  ButtonExt.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 28.06.2022.
//

import UIKit

extension UIButton {
    
    convenience init(title: String, bgColor: UIColor, fgColor: UIColor) {
        self.init(type: .system)
        self.backgroundColor = bgColor
        self.tintColor = fgColor
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont(name: "AvenirNext-bold", size: 18)
        self.layer.cornerRadius = 12
    }
    
}
