//
//  Ingredient.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 28.06.2022.
//

import Foundation
import RealmSwift

class Ingredient: Object, Identifiable {
    @Persisted var id: String = UUID().uuidString
    @Persisted var title: String = ""
    @Persisted var density: Double = 1
    
    convenience init(title: String, density: Double) {
        self.init()
        self.title = title
        self.density = density
    }
    
    static var ingredients: [Ingredient] = [
        Ingredient(title: "Вода", density: 1000),
        Ingredient(title: "Рис", density: 910),
        Ingredient(title: "Соль", density: 2600)
    ]
}

