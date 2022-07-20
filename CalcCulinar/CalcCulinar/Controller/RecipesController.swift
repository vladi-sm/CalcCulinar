//
//  RecipesController.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 07.07.2022.
//

import UIKit

class RecipesController: UIViewController {

    let mainView = RecipesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        self.mainView.collectionView.dataSource = self
        self.mainView.collectionView.delegate = self

    }

}

extension RecipesController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Recipe.recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCell.reuseID, for: indexPath) as! RecipeCell
        let recipe = Recipe.recipes[indexPath.item]
        cell.image.image = UIImage(data: recipe.image)
        cell.titleLabel.text = recipe.title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let recipe = Recipe.recipes[indexPath.item]
        let vc = RecipeController(recipe: recipe)
        self.present(vc, animated: true)
    }
}
