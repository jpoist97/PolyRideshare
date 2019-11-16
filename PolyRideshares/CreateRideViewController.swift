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
    
    @IBOutlet weak var inputTextField: UITextField!
    
    private var datePicker: UIDatePicker?

    var ref: DatabaseReference!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .dateAndTime
        datePicker?.addTarget(self, action: #selector(CreateRideViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CreateRideViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
        inputTextField.inputView = datePicker
        
        //database part
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
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        inputTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
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
