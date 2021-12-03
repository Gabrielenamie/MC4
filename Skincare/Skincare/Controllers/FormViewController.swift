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
    var oilyAnswers: Int = 0
    var normalAnswers: Int = 0
    var dryAnswers: Int = 0
    var mixedAnswers: Int = 0
    var button: UIButton = UIButton()
    
    //label
    @IBOutlet weak var lbl: UILabel!
    //button
    @IBOutlet weak var dryButton: UIButton!
    @IBOutlet weak var oilyButton: UIButton!
    @IBOutlet weak var mixedButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    
    
    @IBAction func nextButton(_ sender: Any) {
        
        if currentQuestion != questions.count {
            
            currentQuestion += 1
            if currentQuestion > 4{
                performSegue(withIdentifier: "choiceView", sender: self)
            }else{
                newQuestion()
                mixedButton.backgroundColor = UIColor(named: "gelo botao")
                normalButton.backgroundColor = UIColor(named: "gelo botao")
                oilyButton.backgroundColor = UIColor(named: "gelo botao")
                dryButton.backgroundColor = UIColor(named: "gelo botao")
               
            }
        }
        
    }
    //Function that dispays new question
    func newQuestion(){
        lbl.text = questions[currentQuestion]
        var x = 0
        for i in 1...4{
            button = view.viewWithTag(i)as! UIButton
            button.titleLabel?.textAlignment = .center
            button.setTitle(answers[currentQuestion][x], for: .normal)
            x += 1
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        newQuestion()
        mixedButton.addTarget(self, action: #selector(clickButton1), for: .touchUpInside)
        normalButton.addTarget(self, action: #selector(clickButton2), for: .touchUpInside)
        oilyButton.addTarget(self, action: #selector(clickButton3), for: .touchUpInside)
        dryButton.addTarget(self, action: #selector(clickButton4), for: .touchUpInside)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newQuestion()
        mixedButton.addTarget(self, action: #selector(clickButton1), for: .touchUpInside)
        normalButton.addTarget(self, action: #selector(clickButton2), for: .touchUpInside)
        oilyButton.addTarget(self, action: #selector(clickButton3), for: .touchUpInside)
        dryButton.addTarget(self, action: #selector(clickButton4), for: .touchUpInside)
        
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
    
    @objc func clicarBotao(botaoSelecionado: UIButton,
                           botao2: UIButton,
                           botao3: UIButton,
                           botao4: UIButton, color: String) {
        if !botaoSelecionado.isSelected{
            botaoSelecionado.backgroundColor = UIColor(named: color)
            botao2.backgroundColor = UIColor(named: "gelo botao")
            botao3.backgroundColor = UIColor(named: "gelo botao")
            botao4.backgroundColor = UIColor(named: "gelo botao")
            
        }
        else {
            botaoSelecionado.backgroundColor = UIColor(named: "gelo botao")
        }
        
        
    }

    
    @objc func clickButton1(){
        clicarBotao(botaoSelecionado: mixedButton, botao2: normalButton, botao3: oilyButton, botao4: dryButton, color: "Roxo botao")
    }
    @objc func clickButton2(){
        clicarBotao(botaoSelecionado: normalButton, botao2: mixedButton, botao3: oilyButton, botao4: dryButton, color: "Azul botao")
        
    }
    @objc func clickButton3(){
        clicarBotao(botaoSelecionado: oilyButton, botao2: normalButton, botao3: mixedButton, botao4: dryButton, color: "Verde botao")
        
    }
    @objc func clickButton4(){
        clicarBotao(botaoSelecionado: dryButton, botao2: normalButton, botao3: oilyButton, botao4: mixedButton, color: "Rosa botao")
    }


}



