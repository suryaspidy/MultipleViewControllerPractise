//
//  MessageTableViewCell.swift
//  MultipleViewControllerPractise
//
//  Created by surya-zstk231 on 24/05/21.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
