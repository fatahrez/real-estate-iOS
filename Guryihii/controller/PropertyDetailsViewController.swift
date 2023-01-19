//
//  PropertyDetailsViewController.swift
//  Guryihii
//
//  Created by Abdulfatah Mohamed on 18/01/2023.
//

import Foundation
import UIKit

class PropertyDetailsViewController : UIViewController, iCarouselDataSource,
                                      iCarouselDelegate{
    
    @IBOutlet weak var propertyImageSlideView: iCarousel!
    @IBOutlet weak var slugLabel: UILabel!
    
    var propertyDetailManager = PropertyDetailManager()
    var slug: String?
    var property: PropertyModel?
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        propertyDetailManager.delegate = self
        propertyDetailManager.fetchPropertyDetails(with: slug ?? "")
        slugLabel.text = slug
    
        images.append(UIImage(named: "house_placeholder")!)
        
        propertyImageSlideView.layer.cornerRadius = 10
        
        propertyImageSlideView.reloadData()
        propertyImageSlideView.type = .timeMachine
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return images.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        print(images)
        let tempView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 250))
        
        let frame = CGRect(x: 0, y: 0, width: 200, height: 250)
        let imageView = UIImageView()
        imageView.frame = frame
        imageView.contentMode = .scaleAspectFit
        
        imageView.image = images[index]
        
        return tempView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option == iCarouselOption.spacing {
            print(value)
            return value * 1.2
        }
        return value
    }
}

extension PropertyDetailsViewController : PropertyDetailManagerDelegate {
    
    func didGetPropertyDetails(_ propertyDetailManager: PropertyDetailManager, _ property: PropertyModel) {
        
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try Data.init(contentsOf: URL.init(string: K.baseURLWithoutAPI+property.cover_photo)!)
                DispatchQueue.main.async {
                    let image: UIImage = UIImage(data: data)!
                    self.images.append(image)
                }
            } catch {
                print(error)
            }
        }
    }
    
    func didFailWith(error: Error) {
        print(error)
    }
    
    
}
