//
//  ProfilesViewController.swift
//  Guryihii
//
//  Created by Abdulfatah Mohamed on 16/01/2023.
//

import UIKit

class ProfilesViewController: UIViewController {

    @IBOutlet weak var profileLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        profileLabel.text = "Profile VC"
        
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
