//
//  CollectionViewCell.swift
//  MultipleViewControllerPractise
//
//  Created by surya-zstk231 on 24/05/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView.layer.borderWidth = 10
        mainView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        
    }

}
