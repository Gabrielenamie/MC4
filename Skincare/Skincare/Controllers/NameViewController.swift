//
//  NameViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 30/11/21.
//

import UIKit

class NameViewController: UIViewController {

    @IBAction func nextView(_ sender: Any) {
        performSegue(withIdentifier: "formsView", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
