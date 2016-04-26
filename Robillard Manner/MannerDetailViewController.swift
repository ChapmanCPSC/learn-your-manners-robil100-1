//
//  MannerDetailViewController.swift
//  Robillard Manner
//
//  Created by Daniel Corona on 4/17/16.
//  Copyright © 2016 Matt Robillard. All rights reserved.
//

import UIKit

class MannerDetailViewController: UIViewController {
    
    @IBOutlet weak var mannerLabel: UILabel!
    @IBOutlet weak var mannerImageView: UIImageView!
    @IBOutlet weak var mannerDescriptionLabel: UILabel!
    
    var m : Manner!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mannerLabel.text = m.name
    
        self.mannerImageView.image = m.image
        self.mannerDescriptionLabel.text = m.description
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
