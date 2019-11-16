//
//  OfferPost.swift
//  PolyRideshares
//
//  Created by Justin Poist on 11/16/19.
//  Copyright © 2019 Justin Poist. All rights reserved.
//

import Foundation

class OfferPost{
    var username = ""
    var fromLocation = ""
    var toLocation = ""
    var date = ""
    var time = 0
    var price = 0
    var phoneNumber = ""
    var stops = false
    var seats = 0
    
    func setUname(fromName username: String) -> Void {
        self.username = username
    }
    
    
}

