//
//  ProductTableViewCell.swift
//  Skincare
//
//  Created by Carolina Ortega on 06/12/21.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet var nomeProduto: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
