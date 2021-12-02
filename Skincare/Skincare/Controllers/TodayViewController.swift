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
        self.routineCollectionView.delegate = self
        self.routineCollectionView.dataSource = self
        var dias: [UIButton] = [dia1, dia2, dia3, dia4, dia5, dia6, dia7]
        
        dia1.translatesAutoresizingMaskIntoConstraints = false
        dia2.translatesAutoresizingMaskIntoConstraints = false
        dia3.translatesAutoresizingMaskIntoConstraints = false
        dia4.translatesAutoresizingMaskIntoConstraints = false
        dia5.translatesAutoresizingMaskIntoConstraints = false
        dia6.translatesAutoresizingMaskIntoConstraints = false
        dia7.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    @objc func clicar(diaSelecionado: UIButton,
                      dia2: UIButton,
                      dia3: UIButton,
                      dia4: UIButton,
                      dia5: UIButton,
                      dia6: UIButton,
                      dia7: UIButton){
        
        if !diaSelecionado.isSelected{
            diaSelecionado.backgroundColor = UIColor(named: "Rosa botao")
            diaSelecionado.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        
            dia2.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            dia2.backgroundColor = UIColor(named: "Bg")
            dia3.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            dia3.backgroundColor = UIColor(named: "Bg")
            dia4.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            dia4.backgroundColor = UIColor(named: "Bg")
            dia5.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            dia5.backgroundColor = UIColor(named: "Bg")
            dia6.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            dia6.backgroundColor = UIColor(named: "Bg")
            dia7.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            dia7.backgroundColor = UIColor(named: "Bg")
            
            
        } else {
            diaSelecionado.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
            diaSelecionado.backgroundColor = UIColor(named: "Bg")
            
        }
        diaSelecionado.isSelected = !diaSelecionado.isSelected
        
        
    }
    
}
//CollectionView
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
