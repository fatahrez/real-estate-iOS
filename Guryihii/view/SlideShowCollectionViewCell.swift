//
//  SlideShowCollectionViewCell.swift
//  Guryihii
//
//  Created by Abdulfatah Mohamed on 22/01/2023.
//

import UIKit

class SlideShowCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideShowItemImageView: UIImageView!
    
    func populate(with propertyImage: String) {
        slideShowItemImageView.clipsToBounds = false
        slideShowItemImageView.layer.cornerRadius = 10
        
        slideShowItemImageView.sd_setImage(with: URL(string: K.baseURLWithoutAPI+propertyImage), placeholderImage: UIImage(named: "house_placeholder"))
    }
}
