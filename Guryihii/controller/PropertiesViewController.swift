//
//  ViewController.swift
//  Guryihii
//
//  Created by Abdulfatah Mohamed on 06/01/2023.
//

import UIKit
import SDWebImage

class PropertiesViewController: UIViewController {
    
    @IBOutlet weak var propertiesTableView: UITableView!
    
    var propertyManager = PropertyManager()
    var properties: [PropertyModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        propertyManager.delegate = self
        propertyManager.fetchProperties()
        
        propertiesTableView.rowHeight = 350
        propertiesTableView.isScrollEnabled = true
        propertiesTableView.alwaysBounceHorizontal = false
        propertiesTableView.separatorStyle = .none
        propertiesTableView.backgroundColor =
        UIColor(
            red: 247.0/255,
            green: 247.0/255,
            blue: 247.0/255,
            alpha: 1.0
        )
        
        self.propertiesTableView.dataSource = self
        self.propertiesTableView.register(
            UINib(nibName: K.propertyCellNibName, bundle: nil),
            forCellReuseIdentifier: K.propertyCellIdentifier
        )
    }
}


// MARK: - PropertyManager Section
extension PropertiesViewController: PropertyManagerDelegate {
    
    func didUpdateProperties(_ propertiesManager: PropertyManager, _ property: [PropertyModel]) {
        DispatchQueue.main.async {
            self.properties = property
            self.propertiesTableView.reloadData()
        }
    }
    
    func didFailWith(error: Error) {
        print(error)
    }
}

extension PropertiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: Add error handling for empty properties array
        return properties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let property = properties[indexPath.row]
        
        let propertyDescription = property.property_type + " | " + property.city + " | " +
        String(property.bedrooms) + " bedroom" + " | " + property.street_address
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.propertyCellIdentifier, for: indexPath)
            as! PropertyTableViewCell
        
        cell.titleLabel.text = propertyDescription
        
        cell.coverPhotoImageView.sd_setImage(with: URL(string: K.baseURLWithoutAPI+property.cover_photo), placeholderImage: UIImage(named: "house_placeholder"))
        cell.priceLabel.setTitle("$"+property.price, for: .normal)
        
        return cell
    }
    
    
}
