//
//  NewIngredientControllerViewController.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 05.07.2022.
//

import UIKit

class NewIngredientController: UIViewController {

    let mainView = NewIngredientView()
    var delegate: NewObjectDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        addActions()
        
        self.mainView.ingredientTitleTF.tf.delegate = self
        self.mainView.densityTF.tf.delegate = self
        
    }
    
    func addActions() {
        
        let saveAction = UIAction { _ in
            
            self.view.endEditing(true)
            guard let title = self.mainView.ingredientTitleTF.tf.text, title != "" else {
                self.mainView.ingredientTitleTF.showError(message: "No create ingredient name")
                return
            }
            
            guard let density = Double(self.mainView.densityTF.tf.text!), density != 0 else {
                self.mainView.densityTF.showError(message: "Enter correct plotnost'")
                return
            }
            
            let ingredient = Ingredient(title: title, density: density)
            RealmService.shared.addIngredient(ingredient) {
                self.delegate?.refreshData()
                self.dismiss(animated: true)
            }
        }
        mainView.saveButton.addAction(saveAction, for: .touchUpInside)
    }

}

extension NewIngredientController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        mainView.ingredientTitleTF.clearError()
        mainView.densityTF.clearError()
    }
    
}
