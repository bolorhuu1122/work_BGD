//
//  HorooDetialViewController.swift
//  BGDuureg
//
//  Created by Bolorkhuu Narantsetseg on 3/19/18.
//  Copyright © 2018 Bolorkhuu Narantsetseg. All rights reserved.
//

import UIKit

class HorooDetialViewController: UIViewController {

    @IBOutlet weak var HoroodDetailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var aboutTextView: UITextView!
    
    
    @IBOutlet weak var ServerButton: UIButton!
    
    
    @IBOutlet weak var LocationButton: UIButton!
    
    @IBOutlet weak var numberListButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func serverButtonClicked(_ sender: Any) {
        
    }
    
    @IBAction func locationButtonClicked(_ sender: UIButton) {
    }
    
    @IBAction func numberListButtonClicked(_ sender: UIButton) {
    }
    
    
}
