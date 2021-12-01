//
//  TodayViewController.swift
//  Skincare
//
//  Created by Carolina Ortega on 01/12/21.
//

import UIKit

class TodayViewController: UIViewController {
    @IBOutlet var routineCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        self.routineCollectionView.delegate = self
        self.routineCollectionView.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
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
