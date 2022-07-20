//
//  Measure.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 28.06.2022.
//

import Foundation
import RealmSwift

class Measure: Object, Identifiable {
    @Persisted var id: String = UUID().uuidString // persisted - property for dataBase
    @Persisted var title: String = ""
    @Persisted var isWeight: Bool = true
    @Persisted var koeff: Double = 1
    
    convenience init(title: String, isWeight: Bool, koeff: Double) {
        self.init()
        self.title = title
        self.isWeight = isWeight
        self.koeff = koeff
    }
    
    static var measures: [Measure] = [Measure(title: "КГ", isWeight: true, koeff: 1),
                                     Measure(title: "Г", isWeight: true, koeff: 0.001),
                                      Measure(title: "Л", isWeight: false, koeff: 0.001),
                                     Measure(title: "Стакан", isWeight: false, koeff: 0.00025),
                                     Measure(title: "Куб.м", isWeight: false, koeff: 1)
    ]
}
