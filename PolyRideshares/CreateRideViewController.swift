//
//  CreateRideViewController.swift
//  PolyRideshares
//
//  Created by Justin Poist on 11/16/19.
//  Copyright © 2019 Justin Poist. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class CreateRideViewController: UIViewController {

    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Test Query code
//        ref.child("users").child("test_child").observeSingleEvent(of: .value, with: { (snapshot) in
//            let value = snapshot.value as? NSDictionary
//            let username = value?["username"] as? String ?? ""
//            let fromLocation = value?["toLocation"] as? String ?? ""
//            print(username, fromLocation)
//        })
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        ref = Database.database().reference()
        self.ref.child("forms").child("test_child").setValue(OfferPost(username: "username1", fromLocation: "f", toLocation: "t", date: "d", time: 0, price: 0, phoneNumber: "408", willStop: false, numSeats: 0).toDictionary(), withCompletionBlock: { err, ref in
            if let error = err {
                print("userInfoDictionary was not saved: \(error.localizedDescription)")
            } else {
                print("userInfoDictionary saved successfully!")
            }
        })
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
