//
//  RecipeController.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 07.07.2022.
//

import UIKit

class RecipeController: UIViewController {

    let recipe: Recipe
    let mainView = RecipeView()
    
    init(recipe: Recipe) {
        self.recipe = recipe
        super.init(nibName: nil, bundle: nil)
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
      
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view = mainView
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
    
    func setupView() {

        mainView.recipeTitleLabel.text = recipe.title
        mainView.recipeImage.image = UIImage(data: recipe.image)!
        mainView.descriptionTextView.text = recipe.descript
    
    }

}

extension RecipeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipe.ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeIngredientCell.reuseID) as! RecipeIngredientCell
        let ingred = recipe.ingredients[indexPath.row]
        cell.titleLabel.text = ingred.title
        cell.countLabel.text = ingred.count
        return cell
    }
    
    
}
