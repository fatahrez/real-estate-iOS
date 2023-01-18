//
//  PropertyTableViewCell.swift
//  Guryihii
//
//  Created by Abdulfatah Mohamed on 17/01/2023.
//

import UIKit

class PropertyTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverPhotoImageView: UIImageView!
    @IBOutlet weak var propertyCardView: UIView!
    @IBOutlet weak var priceLabel: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        propertyCardView.clipsToBounds = false
        propertyCardView.layer.cornerRadius = 15
        propertyCardView.backgroundColor = UIColor.white
        
        self.backgroundColor = UIColor(red: 247.0/255, green: 247.0/255, blue: 247.0/255, alpha: 1.0)
        self.selectionStyle = .none
        
        coverPhotoImageView.layer.cornerRadius = 10
        priceLabel.isUserInteractionEnabled = false
    }

    @IBAction func favouritePressed(_ sender: UIButton) {
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
