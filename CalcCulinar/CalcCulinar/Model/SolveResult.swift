//
//  SolveResult.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 03.07.2022.
//

import Foundation

struct SolveResult: Identifiable {
    let id: String = UUID().uuidString
    let ingredientTitle: String
    let quantity: Double
    let measureTitle: String
}
