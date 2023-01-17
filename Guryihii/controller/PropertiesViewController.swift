//
//  ViewController.swift
//  Guryihii
//
//  Created by Abdulfatah Mohamed on 06/01/2023.
//

import UIKit

class PropertiesViewController: UIViewController {

    @IBOutlet weak var propertiesLabel: UILabel!
    
    var propertyManager = PropertyManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        propertyManager.delegate = self
        propertyManager.fetchProperties()
        
        propertiesLabel.text = "Properties VC"
    }
}


// MARK: - PropertyManager Section
extension PropertiesViewController: PropertyManagerDelegate {
    
    func didUpdateProperties(_ propertiesManager: PropertyManager, _ property: [PropertyModel]) {
        DispatchQueue.main.async {
            print(property)
        }
    }
    
    func didFailWith(error: Error) {
        print(error)
    }
}
