//
//  TodayViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 01/12/21.
//

import UIKit

class TodayViewController: UIViewController {
    @IBOutlet var routineCollectionView: UICollectionView!
    
    @IBOutlet var dia1: UIButton!
    @IBOutlet var dia2: UIButton!
    @IBOutlet var dia3: UIButton!
    @IBOutlet var dia4: UIButton!
    @IBOutlet var dia5: UIButton!
    @IBOutlet var dia6: UIButton!
    @IBOutlet var dia7: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collectionView
        self.routineCollectionView.delegate = self
        self.routineCollectionView.dataSource = self
        //        var dias: [UIButton] = [dia1, dia2, dia3, dia4, dia5, dia6, dia7]
        
        //Botões dos dias da semana
        dia1.translatesAutoresizingMaskIntoConstraints = false
        dia1.addTarget(self, action: #selector(clicarDia1), for: .touchUpInside)
        
        dia2.translatesAutoresizingMaskIntoConstraints = false
        dia2.addTarget(self, action: #selector(clicarDia2), for: .touchUpInside)
        
        dia3.translatesAutoresizingMaskIntoConstraints = false
        dia3.addTarget(self, action: #selector(clicarDia3), for: .touchUpInside)
        
        dia4.translatesAutoresizingMaskIntoConstraints = false
        dia4.addTarget(self, action: #selector(clicarDia4), for: .touchUpInside)
        
        dia5.translatesAutoresizingMaskIntoConstraints = false
        dia5.addTarget(self, action: #selector(clicarDia5), for: .touchUpInside)
        
        dia6.translatesAutoresizingMaskIntoConstraints = false
        dia6.addTarget(self, action: #selector(clicarDia6), for: .touchUpInside)
        
        dia7.translatesAutoresizingMaskIntoConstraints = false
        dia7.addTarget(self, action: #selector(clicarDia7), for: .touchUpInside)

        
        
    }
    //Função que muda o background do botão
    @objc func clicarDias(diaSelecionado: UIButton,
                          dia2: UIButton,
                          dia3: UIButton,
                          dia4: UIButton,
                          dia5: UIButton,
                          dia6: UIButton,
                          dia7: UIButton) {
        if !diaSelecionado.isSelected{
            diaSelecionado.backgroundColor = UIColor(named: "Rosa")
            diaSelecionado.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
            dia2.backgroundColor = UIColor(named: "Bg")
            dia2.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            dia3.backgroundColor = UIColor(named: "Bg")
            dia3.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            dia4.backgroundColor = UIColor(named: "Bg")
            dia4.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            dia5.backgroundColor = UIColor(named: "Bg")
            dia5.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            dia6.backgroundColor = UIColor(named: "Bg")
            dia6.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            dia7.backgroundColor = UIColor(named: "Bg")
            dia7.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            
        }
        else {
            diaSelecionado.backgroundColor = UIColor(named: "Bg")
            diaSelecionado.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        }

        
    }
    
    //Ações dos botões
    @objc func clicarDia1() {
        clicarDias(diaSelecionado: dia1, dia2: dia2, dia3: dia3, dia4: dia4, dia5: dia5, dia6: dia6, dia7: dia7)
    }
    @objc func clicarDia2() {
        clicarDias(diaSelecionado: dia2, dia2: dia1, dia3: dia3, dia4: dia4, dia5: dia5, dia6: dia6, dia7: dia7)
    }
    @objc func clicarDia3() {
        clicarDias(diaSelecionado: dia3, dia2: dia2, dia3: dia1, dia4: dia4, dia5: dia5, dia6: dia6, dia7: dia7)
    }
    @objc func clicarDia4() {
        clicarDias(diaSelecionado: dia4, dia2: dia2, dia3: dia3, dia4: dia1, dia5: dia5, dia6: dia6, dia7: dia7)
    }
    @objc func clicarDia5() {
        clicarDias(diaSelecionado: dia5, dia2: dia2, dia3: dia3, dia4: dia4, dia5: dia1, dia6: dia6, dia7: dia7)
    }
    @objc func clicarDia6() {
        clicarDias(diaSelecionado: dia6, dia2: dia2, dia3: dia3, dia4: dia4, dia5: dia5, dia6: dia1, dia7: dia7)
    }
    @objc func clicarDia7() {
        clicarDias(diaSelecionado: dia7, dia2: dia2, dia3: dia3, dia4: dia4, dia5: dia5, dia6: dia6, dia7: dia1)
    }
    
}
//Formatação da collectionView
extension TodayViewController: UICollectionViewDelegate{
    
}

extension TodayViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = routineCollectionView.dequeueReusableCell(withReuseIdentifier: "rotina", for: indexPath) as! RoutineCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 360, height: 170)
    }
}
