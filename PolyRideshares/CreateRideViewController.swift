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
        ref = Database.database().reference()
        self.ref.child("users").child("test_child").setValue(OfferPost().toDictionary(), withCompletionBlock: { err, ref in
            if let error = err {
                print("userInfoDictionary was not saved: \(error.localizedDescription)")
            } else {
                print("userInfoDictionary saved successfully!")
            }
        })
        // Do any additional setup after loading the view.
    }
    
    
    func uploadForm() -> Void {
        self.ref.child("users").child("test_child").setValue(OfferPost())
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
