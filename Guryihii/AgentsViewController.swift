//
//  AgentsViewController.swift
//  Guryihii
//
//  Created by Abdulfatah Mohamed on 16/01/2023.
//

import UIKit

class AgentsViewController: UIViewController {

    @IBOutlet weak var agentsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        agentsLabel.text = "Agent VC"
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
