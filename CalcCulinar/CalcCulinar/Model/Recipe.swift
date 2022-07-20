//
//  Recipe.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 07.07.2022.
//

import Foundation
import UIKit

class Recipe {
    
    var title: String = ""
    var image: Data = Data()
    var descript: String = ""
    var ingredients = [(title: String , count: String)]()
    
    convenience init(title: String, image: UIImage, descript: String, ingredients: [(String, String)]) {
        self.init()
        self.title = title
        self.image = image.jpegData(compressionQuality: 0.2)!
        self.descript = descript
        self.ingredients = ingredients
    }
    
    static let recipes: [Recipe] = [

        Recipe(title: "Шашлык", image: UIImage(named: "shash")!, descript: "Нарезать мясо, добавить уксус, лук и специи", ingredients: [("Мясо свинины", "2 кг"), ("Лук", "1 штука"), ("Уксус", "10 грамм"), ("Соль", "10 грамм")]),
        Recipe(title: "Шаурма", image: UIImage(named: "shaurma")!, descript: "Завернуть курицу и поджарить, добавить соус", ingredients: [("Лаваш", "1 штука"), ("Лук", "10 грамм"), ("Курица", "80 грамм")]),
        Recipe(title: "Фо-Бо", image: UIImage(named: "fobo")!, descript: "В кипящую воду добавить специи, креветку и порезанный лук", ingredients: [("Вода", "1 литр"), ("Лук", "50 грамм"), ("Креветка", "150 грамм")])
    ]
}
