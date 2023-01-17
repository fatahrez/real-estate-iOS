//
//  MenuViewController.swift
//  Guryihii
//
//  Created by Abdulfatah Mohamed on 16/01/2023.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var menuLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuLabel.text = "Menu VC"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
