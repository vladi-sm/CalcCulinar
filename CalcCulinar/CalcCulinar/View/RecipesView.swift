//
//  RecipesView.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 07.07.2022.
//

import UIKit

class RecipesView: UIView {
    
    let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: CompositionalLayoutManager.shared.createLayout())
    
    init() {
        super.init(frame: CGRect())
        self.backgroundColor = UIColor(named: "pastelBlanco")
        collectionView.backgroundColor = .clear
        
        collectionView.register(RecipeCell.self, forCellWithReuseIdentifier: RecipeCell.reuseID)
        collectionView.showsVerticalScrollIndicator = false
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor)
        ])
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
