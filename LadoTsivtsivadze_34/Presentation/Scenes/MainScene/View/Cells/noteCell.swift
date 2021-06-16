//
//  noteCell.swift
//  LadoTsivtsivadze_34
//
//  Created by lado tsivtsivadze on 6/16/21.
//

import UIKit

class noteCell: UITableViewCell {
    
    var title: String?
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let title = title {
            titleLabel.text = title
        }
        else {
            titleLabel.text = "No Data"
        }
    }
}
