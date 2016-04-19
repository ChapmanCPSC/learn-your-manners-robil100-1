//
//  MannerTableViewCell.swift
//  Robillard Manner
//
//  Created by Daniel Corona on 4/17/16.
//  Copyright © 2016 Matt Robillard. All rights reserved.
//

import UIKit

class MannerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mannerPreview: UIImageView!
    
    @IBOutlet weak var mannerName: UILabel!
    
    let lightblue : UIColor = UIColor(red: 0.6, green: 0.8, blue: 1, alpha: 1)
    let green : UIColor = UIColor(red: 0.251, green: 0.831, blue: 0.494, alpha: 1)
    
    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        
        override func prepareForReuse() {
            self.mannerPreview.subviews.forEach { (v) -> () in
                v.removeFromSuperview()
            }
        }
    
        override func setSelected(selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            self.backgroundColor = lightblue

//             Configure the view for the selected state
            if self.accessoryType == UITableViewCellAccessoryType.Checkmark
            {
                self.backgroundColor = green
            }
        }
    
        func initManner(manner : Manner)
        {
            self.mannerName.text = manner.name
            self.mannerPreview.image = UIImage(named: String(manner.name))
            
        }
    
}
