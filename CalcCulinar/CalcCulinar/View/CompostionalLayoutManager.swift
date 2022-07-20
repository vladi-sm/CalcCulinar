//
//  CompostionalLayoutManager.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 07.07.2022.
//

import Foundation
import UIKit

class CompositionalLayoutManager {
    
    static let shared = CompositionalLayoutManager()
    private init() {}
    
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            sectionIndex, _ in
            
            return self.createRecipes()
        }
        
        return layout
    }
    func createRecipes() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.47), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.6))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        group.interItemSpacing = .fixed(8)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.orthogonalScrollingBehavior = .none
        section.contentInsets = .init(top: 6, leading: 4, bottom: 0, trailing: 4)
        
        return section
    }
}
