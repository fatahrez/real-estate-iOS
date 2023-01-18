//
//  PropertyDetailsViewController.swift
//  Guryihii
//
//  Created by Abdulfatah Mohamed on 18/01/2023.
//

import Foundation
import UIKit

class PropertyDetailsViewController : UIViewController {
    
    @IBOutlet weak var slugLabel: UILabel!
    
    var slug: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slugLabel.text = slug
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        slug = ""
    }
}
