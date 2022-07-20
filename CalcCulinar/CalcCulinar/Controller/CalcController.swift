//
//  ViewController.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 28.06.2022.
//

import UIKit

protocol NewObjectDelegate {
    func refreshData()
}

class CalcController: UIViewController {

    let mainView = CalcView()
    var inMeasure: Measure = Measure.measures[0]
    var outMeasure: Measure = Measure.measures[0]
    var ingredient: Ingredient = Ingredient.ingredients[0]
    var measures = [Measure]()
    var ingredients = [Ingredient]()
    var solveResults: [SolveResult] = [] {
        didSet {
            self.mainView.tableView.reloadData()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        addActions()
        mainView.ingredientPicker.delegate = self
        mainView.inMeasurePicker.delegate = self
        mainView.outMeasurePicker.delegate = self
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.inMeasurePicker.dataSource = self
        mainView.outMeasurePicker.dataSource = self
        mainView.ingredientPicker.dataSource = self
        RealmService.shared.printURLofDB()
        getMeasures()
        getIngredients()
        
    }

    func getMeasures() {
        self.measures = RealmService.shared.getAllMeasures()
    }
    
    func getIngredients() {
        self.ingredients = RealmService.shared.getAllIngredient()
    }
    
    func calculate() {
        guard let quantity = Double(mainView.inputValueTF.text!) else {
            print("Can't convert to double")
            return
        }
        
        // M -> V
        // V -> M
        // M -> M || V -> V
        
        var outValue: Double = 0
        
        switch(inMeasure.isWeight, outMeasure.isWeight) {
        case (true, false):
            outValue = inMeasure.koeff * quantity / (outMeasure.koeff * ingredient.density)
        case (false, true):
            outValue = inMeasure.koeff * quantity * ingredient.density / outMeasure.koeff
        case (true, true):
            outValue = inMeasure.koeff * quantity / outMeasure.koeff
        case (false, false):
            outValue = inMeasure.koeff * quantity / outMeasure.koeff
        }
        
        mainView.outValueLabel.text = "\(String.init(format: "%.5f", outValue))"
    
    }
    
    func addActions() {
        let plusTapAction = UIAction { _ in
            
            let alert = UIAlertController(title: "Что вы хотите добавить", message: nil, preferredStyle: .actionSheet)
            
            let measureAction = UIAlertAction(title: "Меру", style: .default) { _ in
                let vc = NewMeasureController()
                vc.delegate = self
                self.present(vc, animated: true)
            }
            
            let ingredientAction = UIAlertAction(title: "Ингридиент", style: .default) { _ in
                let vc = NewIngredientController()
                vc.delegate = self
                self.present(vc,animated: true)
            }
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
            alert.addAction(measureAction)
            alert.addAction(ingredientAction)
            alert.addAction(cancelAction)
            
            self.present(alert, animated: true)
        }
        
        let calcAction = UIAction { _ in
            self.calculate()
        }
        
        let memberTapAction = UIAction { _ in
            
            guard let quantity = Double(self.mainView.outValueLabel.text!) else {return}
            
            let solveResult = SolveResult(ingredientTitle: self.ingredient.title, quantity: quantity, measureTitle: self.outMeasure.title)
            self.solveResults.append(solveResult)
        }
        
        mainView.memoryButton.addAction(memberTapAction, for: .touchUpInside)
        mainView.solveButton.addAction(calcAction, for: .touchUpInside)
        mainView.plusButton.addAction(plusTapAction, for: .touchUpInside)
    }
}

extension CalcController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.solveResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IngredientCell.reuseID) as! IngredientCell
        let result = solveResults[indexPath.row]
        
        cell.titleLabel.text = result.ingredientTitle
        cell.quantityLabel.text = "\(result.quantity)"
        cell.measureLabel.text = result.measureTitle
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { _, _, _ in
            self.solveResults.remove(at: indexPath.row)
            self.mainView.inputMeasureTF.text?.removeAll()
            self.mainView.outMeasureTF.text?.removeAll()
            self.mainView.inputValueTF.text?.removeAll()
            self.mainView.ingredientTF.text?.removeAll()
        }
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        return config
    }
    
}

extension CalcController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case mainView.inMeasurePicker: return self.measures[row].title
        case mainView.outMeasurePicker: return self.measures[row].title
        case mainView.ingredientPicker: return self.ingredients[row].title
        default: return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case mainView.inMeasurePicker:
            self.inMeasure = Measure.measures[row]
            self.mainView.inputMeasureTF.text = self.measures[row].title
        case mainView.outMeasurePicker:
            self.outMeasure = self.measures[row]
            self.mainView.outMeasureTF.text = self.measures[row].title
        case mainView.ingredientPicker:
            self.ingredient =  self.ingredients[row]
            self.mainView.ingredientTF.text = self.ingredients[row].title
        default: break
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case mainView.inMeasurePicker: return self.measures.count
        case mainView.outMeasurePicker: return self.measures.count
        case mainView.ingredientPicker: return self.ingredients.count
        default: return 0
        }
    }
    
}

extension CalcController: NewObjectDelegate {
    func refreshData() {
        self.getMeasures()
        self.getIngredients()
    }
}
