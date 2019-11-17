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
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var fromLocTextField: UITextField!
    @IBOutlet weak var toLocTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var seatsTextField: UITextField!
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
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        //database part
        ref = Database.database().reference()
        self.ref.child("forms").childByAutoId().setValue(fillOfferPost().toDictionary(), withCompletionBlock: { err, ref in
            if let error = err {
                print("userInfoDictionary was not saved: \(error.localizedDescription)")
            } else {
                print("userInfoDictionary saved successfully!")
            }
        })
    

        let queryByFrom = ref.child("forms").queryOrdered(byChild: "fromLocation").queryEqual(toValue: "SLO")
        let queryByTo = ref.child("forms").queryOrdered(byChild: "toLocation").queryEqual(toValue: "BERK")
        let queryByDate = ref.child("forms").queryOrdered(byChild: "date").queryEqual(toValue: "11/20/19")
        
        var fromArray: [OfferPost]
        var toArray: [OfferPost]
        var dateArray: [OfferPost]
        
        fromArray = []
        toArray = []
        dateArray = []
        
        queryByFrom.observeSingleEvent(of: .value
            , with: { (snapshot) in
                if let value = snapshot.value as? NSDictionary{
                    print(value)
                    let keys = value.allKeys
                    for key in keys{
                        let post = value[key] as! NSDictionary
                        fromArray.append(OfferPost(username: post.value(forKey: "username") as! String, fromLocation: post.value(forKey: "fromLocation") as! String, toLocation: post.value(forKey: "toLocation") as! String, date: post.value(forKey: "date") as! String, time: post.value(forKey: "time") as! String, price: post.value(forKey: "price") as! String, phoneNumber: post.value(forKey: "phoneNumber") as! String, willStop: false, numSeats: post.value(forKey: "numSeats") as! String))
                    }
                    print("FROMARRAY", fromArray)
                }
                
        })
        
        queryByTo.observeSingleEvent(of: .value
            , with: { (snapshot) in
                if let value = snapshot.value as? NSDictionary{
                    print(value)
                    let keys = value.allKeys
                    for key in keys{
                        let post = value[key] as! NSDictionary
                        toArray.append(OfferPost(username: post.value(forKey: "username") as! String, fromLocation: post.value(forKey: "fromLocation") as! String, toLocation: post.value(forKey: "toLocation") as! String, date: post.value(forKey: "date") as! String, time: post.value(forKey: "time") as! String, price: post.value(forKey: "price") as! String, phoneNumber: post.value(forKey: "phoneNumber") as! String, willStop: false, numSeats: post.value(forKey: "numSeats") as! String))
                    }
                    print("TOARRAY", toArray)

                }
        })
        
        queryByDate.observeSingleEvent(of: .value
            , with: { (snapshot) in
                if let value = snapshot.value as? NSDictionary{
                    print(value)
                    let keys = value.allKeys
                    for key in keys{
                        let post = value[key] as! NSDictionary
                        dateArray.append(OfferPost(username: post.value(forKey: "username") as! String, fromLocation: post.value(forKey: "fromLocation") as! String, toLocation: post.value(forKey: "toLocation") as! String, date: post.value(forKey: "date") as! String, time: post.value(forKey: "time") as! String, price: post.value(forKey: "price") as! String, phoneNumber: post.value(forKey: "phoneNumber") as! String, willStop: false, numSeats: post.value(forKey: "numSeats") as! String))

                    }
                    print("DATEARRAY", dateArray)
                }
        })
        
        
        //let set1:Set<String> = Set(toArray)
    }
    
    func fillOfferPost() -> OfferPost {
        let fullDate = inputTextField.text!
        let dateArr = fullDate.components(separatedBy: " ")
        let date = dateArr[0]
        let time = dateArr[1]
        
        return OfferPost(username: nameTextField.text!, fromLocation: fromLocTextField.text!, toLocation: toLocTextField.text!, date: date, time: time, price: priceTextField.text!, phoneNumber: phoneNumberTextField.text!, willStop: false, numSeats: seatsTextField.text!)
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
    
    
//    func uploadForm() -> Void {
//        self.ref.child("users").child("test_child").setValue(OfferPost())
//    }
    
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
