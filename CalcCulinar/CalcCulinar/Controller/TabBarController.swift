//
//  TabBarController.swift
//  CalcCulinar
//
//  Created by Vladislav Smetanin on 07.07.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            generateNavVC(root: CalcController(), title: "Converter", image: UIImage(systemName: "number.circle")!),
            generateNavVC(root: RecipesController(), title: "Recipes", image: UIImage(systemName: "menucard")!)
        ]
        tabBar.backgroundColor = UIColor(named: "blackAlpha")
    }
    
    func generateNavVC(root: UIViewController, title: String, image: UIImage) -> UINavigationController {
        
        let vc = UINavigationController(rootViewController: root)
        vc.tabBarItem.title = title
        vc.tabBarItem.image = image
        return vc
    }
    
}
