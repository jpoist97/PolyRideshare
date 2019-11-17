//
//  OfferPost.swift
//  PolyRideshares
//
//  Created by Justin Poist on 11/16/19.
//  Copyright © 2019 Justin Poist. All rights reserved.
//

import Foundation

//Class that represents the attributes of a post that can be converted to a NSDictionary to store on the firebase database.
class OfferPost: CustomStringConvertible, Hashable, Equatable{
    var username: String
    var fromLocation: String
    var toLocation: String
    var date: String
    var time: String
    var price: String
    var phoneNumber: String
    var willStop: Bool
    var numSeats: String
    public var description: String { return "OfferPost: \(username) \(fromLocation) \(toLocation) \(date)" }
    
    //No-args constructor for a OfferPost Object
    init() {
        self.username = ""
        self.fromLocation = ""
        self.toLocation = ""
        self.date = ""
        self.time = ""
        self.price = ""
        self.phoneNumber = ""
        self.willStop = false
        self.numSeats = ""
    }
    
    
    //Constructor for a OfferPost Object using the specified parameters
    init(username:String, fromLocation:String, toLocation:String, date:String, time:String, price:String, phoneNumber:String, willStop:Bool, numSeats:String) {
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
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.username)
        hasher.combine(self.fromLocation)
        hasher.combine(self.toLocation)
        hasher.combine(self.date)
        hasher.combine(self.time)
        hasher.combine(self.price)
        hasher.combine(self.phoneNumber)
        hasher.combine(self.willStop)
        hasher.combine(self.numSeats)
    }
    
    static func ==(lhs: OfferPost, rhs: OfferPost) -> Bool {
        return lhs.username == rhs.username && lhs.toLocation == rhs.toLocation && lhs.fromLocation == rhs.fromLocation && lhs.date == rhs.date && lhs.time == rhs.time && lhs.price == rhs.price && lhs.phoneNumber == rhs.phoneNumber && lhs.willStop == rhs.willStop && lhs.numSeats == rhs.numSeats
    }
    
    
}

