//
//  NewRoutineViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 02/12/21.
//

import UIKit

class NewRoutineViewController: UIViewController {
    @IBOutlet var tasksTableView: UITableView!
    
    @IBOutlet var routineName: UITextField!
    
    @IBOutlet var dom: UIButton!
    @IBOutlet var seg: UIButton!
    @IBOutlet var ter: UIButton!
    @IBOutlet var qua: UIButton!
    @IBOutlet var qui: UIButton!
    @IBOutlet var sex: UIButton!
    @IBOutlet var sab: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //picker
        UIDatePicker.appearance().tintColor = UIColor(named: "Rosa botao")
        //        var week: [UIButton] = [dom, seg, ter, qua, qui, sex, sab]
        
        //textField
        routineName.layer.borderWidth = 1
        routineName.layer.cornerRadius = 6
        routineName.layer.borderColor = UIColor(named: "Rosa botao")?.cgColor
        
        //tableView
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
        
        //botões de repetição
        dom.translatesAutoresizingMaskIntoConstraints = false
        dom.addTarget(self, action: #selector(clicar(botao:)), for: .touchUpInside)
        seg.translatesAutoresizingMaskIntoConstraints = false
        seg.addTarget(self, action: #selector(clicar(botao:)), for: .touchUpInside)
        ter.translatesAutoresizingMaskIntoConstraints = false
        ter.addTarget(self, action: #selector(clicar(botao:)), for: .touchUpInside)
        qua.translatesAutoresizingMaskIntoConstraints = false
        qua.addTarget(self, action: #selector(clicar(botao:)), for: .touchUpInside)
        qui.translatesAutoresizingMaskIntoConstraints = false
        qui.addTarget(self, action: #selector(clicar(botao:)), for: .touchUpInside)
        sex.translatesAutoresizingMaskIntoConstraints = false
        sex.addTarget(self, action: #selector(clicar(botao:)), for: .touchUpInside)
        sab.translatesAutoresizingMaskIntoConstraints = false
        sab.addTarget(self, action: #selector(clicar(botao:)), for: .touchUpInside)
        
    }
    //ação do botão de repetição
    @objc func clicar(botao: UIButton){
        if !botao.isSelected{
//            botao.setTitleColor(.white, for: .normal)
            botao.backgroundColor = UIColor(named: "Rosa botao")
            botao.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
            
        } else {
//            botao.setTitleColor(.black, for: .normal)
            botao.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            botao.backgroundColor = UIColor(named: "Bg")
            
        }
        botao.isSelected = !botao.isSelected
        
        
    }
}

//tableView
extension NewRoutineViewController: UITableViewDelegate{
    
}

extension NewRoutineViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tasksTableView.dequeueReusableCell(withIdentifier: "task", for: indexPath) as! TaskTableViewCell
        return cell
    }
    
    
}
