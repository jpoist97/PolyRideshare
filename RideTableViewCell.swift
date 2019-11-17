//
//  RideTableViewCell.swift
//  PolyRideshares
//
//  Created by Jack Fales on 11/16/19.
//  Copyright © 2019 Justin Poist. All rights reserved.
//

import UIKit

class RideTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var fromToLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var seatsNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
