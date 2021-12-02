//
//  SkinTypeViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 30/11/21.
//

import UIKit

class SkinTypeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Anterior",
            style: .plain,
            target: self,
            action: #selector(back)
        )
        // Do any additional setup after loading the view.
    }
    @objc func back(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "forms") as! FormViewController
        vc.currentQuestion = vc.currentQuestion <= vc.questions.count ? 4 : 1
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
