//
//  OfferPost.swift
//  PolyRideshares
//
//  Created by Justin Poist on 11/16/19.
//  Copyright © 2019 Justin Poist. All rights reserved.
//

import Foundation

//Class that represents the attributes of a post that can be converted to a NSDictionary to store on the firebase database.
class OfferPost{
    var username: String
    var fromLocation: String
    var toLocation: String
    var date: String
    var time: Int
    var price: Int
    var phoneNumber: String
    var willStop: Bool
    var numSeats: Int
    
    //No-args constructor for a OfferPost Object
    init() {
        self.username = ""
        self.fromLocation = ""
        self.toLocation = ""
        self.date = ""
        self.time = 0
        self.price = 0
        self.phoneNumber = ""
        self.willStop = false
        self.numSeats = 0
    }
    
    
    //Constructor for a OfferPost Object using the specified parameters
    init(username:String, fromLocation:String, toLocation:String, date:String, time:Int, price:Int, phoneNumber:String, willStop:Bool, numSeats:Int) {
        self.username = username
        self.fromLocation = fromLocation
        self.toLocation = toLocation
        self.date = date
        self.time = time
        self.price = price
        self.phoneNumber = phoneNumber
        self.willStop = willStop
        self.numSeats = numSeats
    }
    
    //Simple method that converts OfferPost to a NSDictionary object in order to properly add to database.
    func toDictionary() -> NSDictionary{
        return ["username" : self.username,
            "fromLocation" : self.fromLocation,
            "toLocation" : self.toLocation,
            "date" : self.date,
            "time" : self.time,
            "price" : self.price,
            "phoneNumber" : self.phoneNumber,
            "willStop" : self.willStop,
            "numSeats" : self.numSeats]
    }
    
}

