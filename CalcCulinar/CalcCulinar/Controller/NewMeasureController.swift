//
//  NewMeasureController.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 02.07.2022.
//

import UIKit

class NewMeasureController: UIViewController {

    let mainView = NewMeasureView()
    var delegate: NewObjectDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        addActions()
    }
    
    func addActions() {
        
        let saveTapAction = UIAction { _ in
            guard let title = self.mainView.measureTitleTextField.text, title.count > 0 else { return }
            guard let coeff = Double(self.mainView.coeffTextField.text!) else { return }
            var isWeight = true
            if self.mainView.typeControl.selectedSegmentIndex == 0 {
                isWeight = true
            } else {
                isWeight = false
            }
            let measure = Measure(title: title, isWeight: isWeight, koeff: coeff)
            RealmService.shared.addMeasure(measure) {
                self.delegate?.refreshData()
                self.dismiss(animated: true)
            }
            
        }
        
        mainView.saveButton.addAction(saveTapAction, for: .touchUpInside)
    }
}
