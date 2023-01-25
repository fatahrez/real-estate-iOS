//
//  PropertyDetailsViewController.swift
//  Guryihii
//
//  Created by Abdulfatah Mohamed on 18/01/2023.
//

import Foundation
import UIKit

class PropertyDetailsViewController : UIViewController {
    
    @IBOutlet weak var propertyImagesCollectionView: UICollectionView!
    @IBOutlet weak var slugLabel: UILabel!
    
    var propertyDetailManager = PropertyDetailManager()
    var slug: String?
    var property: PropertyModel?
    var images: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        propertyDetailManager.delegate = self
        propertyDetailManager.fetchPropertyDetails(with: slug ?? "")
        
        propertyImagesCollectionView.dataSource = self
        
        let layout = propertyImagesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
//        layout.minimumLineSpacing = 1
//        layout.minimumInteritemSpacing = 1
//
//        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    
}

extension PropertyDetailsViewController : PropertyDetailManagerDelegate {
    
    func didGetPropertyDetails(_ propertyDetailManager: PropertyDetailManager, _ property: PropertyModel) {
        
        DispatchQueue.main.async {
            if !property.cover_photo.isEmpty {
                self.images.append(property.cover_photo)
            }
            if !property.photo1.isEmpty {
                self.images.append(property.photo1)
            }
            if !property.photo2.isEmpty {
                self.images.append(property.photo2)
            }
            if !property.photo3.isEmpty {
                self.images.append(property.photo3)
            }
            if !property.photo4.isEmpty {
                self.images.append(property.photo4)
            }
            self.propertyImagesCollectionView.reloadData()
        }
    }
    
    func didFailWith(error: Error) {
        print(error)
    }
    
}


extension PropertyDetailsViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "SlideShowCollectionViewCell", for: indexPath)
        as! SlideShowCollectionViewCell
        cell.populate(with: self.images[indexPath.row])
        return cell
    }
}


//extension PropertyDetailsViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: <#T##Double#>, height: <#T##Double#>)
//    }
//}
