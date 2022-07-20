//
//  LabelExt.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 28.06.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, isDark: Bool) {
        self.init(frame: CGRect())
        self.text = text
        self.font = font
        self.textColor = isDark ? .black : .white
    }
    
}
