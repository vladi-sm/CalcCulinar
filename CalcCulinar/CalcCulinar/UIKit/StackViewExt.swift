//
//  StackViewExt.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 28.06.2022.
//

import UIKit

extension UIStackView {
    convenience init(views: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: views)
        self.spacing = spacing
        self.axis = axis
    }
}
