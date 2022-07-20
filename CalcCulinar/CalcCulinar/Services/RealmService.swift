//
//  RealmService.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 05.07.2022.
//

import Foundation
import RealmSwift

class RealmService {
    
    static let shared = RealmService() // singleton
    
    private init() {
        
    }
    
    private let db = try! Realm()
    
    func printURLofDB() {
        print(db.configuration.fileURL!)
    }
    
    func addMeasure(_ measure: Measure, completion: () -> ()) {
        try! db.write {
            db.add(measure)
        }
        completion()
    }
    
    func getAllMeasures() -> [Measure] {
        
        let measuresFromDB = db.objects(Measure.self)
        if  measuresFromDB.count == 0 {
            print("Add Start Measures")
            for measure in Measure.measures {
                addMeasure(measure, completion:{})
            }
            return Measure.measures
        } else {
            print("Retrieve Measures")
            var measures = [Measure]()
            for measure in measuresFromDB {
                measures.append(measure)
            }
            return measures
        }
    }
    
    func addIngredient(_ ingredient: Ingredient, completion: () -> ()) {
        try! db.write {
            db.add(ingredient)
        }
        completion()
    }
    
    func getAllIngredient() -> [Ingredient] {
        
        let ingredientsFromDB = db.objects(Ingredient.self)
        if  ingredientsFromDB.count == 0 {
            print("Add Start Ingredients")
            for ingredient in Ingredient.ingredients {
                addIngredient(ingredient, completion: {})
            }
            return Ingredient.ingredients
        } else {
            print("Retrieve Measures")
            var ingredients = [Ingredient]()
            for ingredient in ingredientsFromDB {
                ingredients.append(ingredient)
            }
            return ingredients
        }
    }
}
