//
//  NameViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 30/11/21.
//

import UIKit

class NameViewController: UIViewController {
    @IBOutlet var name: UITextField!
    
    @IBAction func nextView(_ sender: Any) {
        performSegue(withIdentifier: "formsView", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        name.layer.borderWidth = 1
        name.layer.cornerRadius = 6
        name.layer.borderColor = UIColor(named: "Rosa botao")?.cgColor
        
        
        // Do any additional setup after loading the view.
    }
    
    
}
