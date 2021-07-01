//
//  MetrictoImperialViewController.swift
//  Reg Hex convertor
//
//  Created by Pallavi on 22/06/21.
//

import UIKit

class MetrictoImperialViewController: UIViewController {

    @IBOutlet weak var volumeButton: UIButton!
    @IBOutlet weak var lengthbutton: UIButton!
    @IBOutlet weak var weightbutton: UIButton!
    @IBAction func volumeButtonTouchUp(_ sender: Any) {
    }
    @IBAction func lenthbuttonTouchUp(_ sender: Any) {
    }
    @IBAction func weightButtonTouchup(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Welcome"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        loadMenu()
    }
    func loadMenu(){
        var menuItems: [UIAction] {
            return [
                UIAction(title: "Pounds", handler: { (_) in
                }),
                UIAction(title: "Ounces", handler: { (_) in
                }),
                UIAction(title: "Stone",  handler: { (_) in
                }),
                UIAction(title: "Milligrams", handler: {(_) in
                    
                }),
                UIAction(title: "Grams",handler: {(_) in }),
                UIAction(title: "Kilograms", handler: {(_) in }),
                UIAction(title: "Tons",  handler: {(_) in})
            ]
        }

        var demoMenu: UIMenu {
            return UIMenu(title: "My menu", image: nil, identifier: nil, options: [], children: menuItems)
        }
        
        weightbutton.menu = demoMenu
        weightbutton.showsMenuAsPrimaryAction = true
    }
    

   
}
