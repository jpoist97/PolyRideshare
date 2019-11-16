//
//  OfferPost.swift
//  PolyRideshares
//
//  Created by Justin Poist on 11/16/19.
//  Copyright © 2019 Justin Poist. All rights reserved.
//

import Foundation

class OfferPost{
    var username: String
    var fromLocation: String
    var toLocation: String
    var date: String
    var time: Int
    var price: Int
    var phoneNumber: String
    var stops: Bool
    var seats: Int
    
    init() {
        self.username = ""
        self.fromLocation = ""
        self.toLocation = ""
        self.date = ""
        self.time = 0
        self.price = 0
        self.phoneNumber = ""
        self.stops = false
        self.seats = 0
    }
    
    func setUname(fromName username: String) -> Void {
        self.username = username
    }
    
    func toDictionary() -> NSDictionary{
        return ["username" : self.username,
            "fromLocation" : self.fromLocation]
    }
    
}

