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
    
    var slug: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        propertyManager.delegate = self
        propertyManager.fetchProperties()
        
        propertiesTableView.rowHeight = 350
        propertiesTableView.isScrollEnabled = true
        propertiesTableView.alwaysBounceHorizontal = false
        propertiesTableView.separatorStyle = .none
        
        self.propertiesTableView.delegate = self
        self.propertiesTableView.dataSource = self
        self.propertiesTableView.register(
            UINib(nibName: K.propertyCellNibName, bundle: nil),
            forCellReuseIdentifier: K.propertyCellIdentifier
        )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.propertyDetailsSegue {
            let destinationVC = segue.destination as! PropertyDetailsViewController
            destinationVC.slug = slug
        }
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

extension PropertiesViewController: UITableViewDataSource, UITableViewDelegate {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        slug = properties[indexPath.row].slug
        performSegue(withIdentifier: K.propertyDetailsSegue, sender: self)
    }
    
}

