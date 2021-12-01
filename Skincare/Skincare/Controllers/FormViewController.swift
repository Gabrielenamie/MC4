//
//  FormViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 30/11/21.
//

import UIKit

class FormViewController: UIViewController {
    let questions = ["Quantas vezes por dia você sente necessidade de lavar o rosto?","Como você descreveria sua pele?", "Poros são buraquinhos na pele. Ao se olhar no espelho, você consegue observá-los?","Você costuma ter espinhas ou cravos?","Depois de praticar uma atividade física, seu rosto fica como?"]
    let answers = [["Em dias úmidos ou no verão sinto mais necessidade", "Só uma vez, geralmente para tirar a maquiagem", "Várias vezes,sinto minha pele com aspecto sujo", "Não sinto necessidade, somente no banho"],
                   ["Em alguns locais parece oleosa e em outros não", "Não possuo oleosidade aparente, estando sempre com aspecto hidratado", "Muita oleosidade por todo o rosto, podendo aparecer espinhas","Minha pele é opaca e sem brilho, às vezes avermelhada ou recssecada"],
                   ["Posso vê-los mais no queixo, nariz ou testa", "Não muito, são pouco aparentes","Sim, posso ver no rosto todo","Não, minha pele é completamente lisa"],
                   ["De vez em quando","É bem difícil","Quase sempre","Nunca"],
                   ["Um pouco oleoso e suado", "Com as bochechas avermelhadas e suado", "Muito oleoso e 'pegajoso'","Avermelhado e ardendo"]]
    
    var currentQuestion = 0
    var oilyAnswers = 0
    var normalAnswers = 0
    var dryAnswers = 0
    var mixedAnswers = 0
    

    //label
    @IBOutlet weak var lbl: UILabel!
    //button

    @IBAction func nextButton(_ sender: Any) {
        if currentQuestion != questions.count{
            currentQuestion += 1
            if currentQuestion > 4{
              performSegue(withIdentifier: "choiceView", sender: self)
            }else{
            newQuestion()
            }
        }
    }

        //Function that dispays new question
    func newQuestion(){
        lbl.text = questions[currentQuestion]
        var button:UIButton = UIButton()
        var x = 0
        for i in 1...4{
            button = view.viewWithTag(i)as! UIButton
            button.setTitle(answers[currentQuestion][x], for: .normal)
            x += 1
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        newQuestion()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        newQuestion()
        let myBackButton:UIButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
        myBackButton.setTitle("Anterior", for: UIControl.State.normal)
        myBackButton.addTarget(self, action: #selector(previousAction), for: .touchUpInside)
        let myCustomBackButtonItem:UIBarButtonItem = UIBarButtonItem(customView: myBackButton)
        self.navigationItem.leftBarButtonItem  = myCustomBackButtonItem
        }
    @objc func previousAction(sender: UIButton){
        if currentQuestion != questions.count{
            newQuestion()
            
        }else{
            performSegue(withIdentifier: "formsView", sender: self)
        }
    }
}
