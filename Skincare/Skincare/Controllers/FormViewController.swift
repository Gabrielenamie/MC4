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
    var button:UIButton = UIButton()
    
    //label
    @IBOutlet weak var lbl: UILabel!
    //button
    @IBOutlet weak var dryButton: UIButton!
    @IBOutlet weak var oilyButton: UIButton!
    @IBOutlet weak var MixedButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    @IBAction func buttonColors(_ sender: Any) {
        guard let tag = (sender as? UIButton)?.tag else{
            return
        }
        if tag == 1{
            MixedButton.backgroundColor = UIColor.purple
            normalButton.isSelected = false
            oilyButton.isSelected = false
            dryButton.isSelected = false
        }else if tag == 2{
            normalButton.backgroundColor = UIColor.green
        }else if tag == 3{
            oilyButton.backgroundColor = UIColor.gray
        }else if tag == 4{
            dryButton.backgroundColor = UIColor.gray
        }
        
        //            MixedButton.isExclusiveTouch = true
        //            oilyButton.isExclusiveTouch = true
        //            dryButton.isExclusiveTouch = true
        //            normalButton.isExclusiveTouch = true
        //
        
    }
    
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Anterior",
            style: .plain,
            target: self,
            action: #selector(backForms)
        )
    }
    @objc func backForms(){
        if currentQuestion <= 4 && currentQuestion != 0{
            currentQuestion -= 1
            return newQuestion()
        }else if currentQuestion == 0{
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(identifier: "name") as! NameViewController
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }
}


