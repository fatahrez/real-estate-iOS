//
//  PropertyDetailsViewController.swift
//  Guryihii
//
//  Created by Abdulfatah Mohamed on 18/01/2023.
//

import Foundation
import UIKit

class PropertyDetailsViewController : UIViewController {
    
    @IBOutlet weak var propertyImageSlideView: iCarousel!
    @IBOutlet weak var slugLabel: UILabel!
    
    var propertyDetailManager = PropertyDetailManager()
    var slug: String?
    var property: PropertyModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        propertyDetailManager.delegate = self
        propertyDetailManager.fetchPropertyDetails(with: slug ?? "")
        slugLabel.text = slug
    
    }
    
}

extension PropertyDetailsViewController : PropertyDetailManagerDelegate {
    
    func didGetPropertyDetails(_ propertyDetailManager: PropertyDetailManager, _ property: PropertyModel) {
        
        DispatchQueue.global(qos: .background).async {
        }
    }
    
    func didFailWith(error: Error) {
        print(error)
    }
    
    
}
