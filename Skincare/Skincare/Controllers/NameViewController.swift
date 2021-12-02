//
//  NameViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 30/11/21.
//

import UIKit

class NameViewController: UIViewController {

       override func viewDidLoad() {
        super.viewDidLoad()
           navigationItem.leftBarButtonItem = UIBarButtonItem(
               title: "Anterior",
               style: .plain,
               target: self,
               action: #selector(onboardingBack)
           )
           // Do any additional setup after loading the view.
       }
       @objc func onboardingBack(){
               let storyBoard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyBoard.instantiateViewController(identifier: "firstView") as! OnboardingViewController
               self.navigationController?.pushViewController(vc, animated: false)
           }
    
}
