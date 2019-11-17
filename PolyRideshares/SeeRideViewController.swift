//
//  SeeRideViewController.swift
//  PolyRideshares
//
//  Created by Justin Poist on 11/16/19.
//  Copyright © 2019 Justin Poist. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SeeRideViewController: UIViewController {
    @IBOutlet weak var inputDateTimeTextField: UITextField!
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var toTextField: UITextField!
    
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .dateAndTime
        datePicker?.addTarget(self, action: #selector(SeeRideViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SeeRideViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
        inputDateTimeTextField.inputView = datePicker

        // Do any additional setup after loading the view.
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        inputDateTimeTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
        
    }
    
    func queryByFrom(fromLocation:String) -> Set<OfferPost> {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        let queryByFrom = ref.child("forms").queryOrdered(byChild: "fromLocation").queryEqual(toValue: fromLocation)
        
        var fromArray: [OfferPost]
        fromArray = []
        
        queryByFrom.observeSingleEvent(of: .value
            , with: { (snapshot) in
                if let value = snapshot.value as? NSDictionary{

                    let keys = value.allKeys
                    for key in keys{
                        let post = value[key] as! NSDictionary
                        fromArray.append(OfferPost(username: post.value(forKey: "username") as! String, fromLocation: post.value(forKey: "fromLocation") as! String, toLocation: post.value(forKey: "toLocation") as! String, date: post.value(forKey: "date") as! String, time: post.value(forKey: "time") as! String, price: post.value(forKey: "price") as! String, phoneNumber: post.value(forKey: "phoneNumber") as! String, willStop: false, numSeats: post.value(forKey: "numSeats") as! String))
                    }

                }
        })
        
        return Set(fromArray)
    }
    
    func queryByTo(toLocation:String) -> Set<OfferPost> {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        let queryByTo = ref.child("forms").queryOrdered(byChild: "toLocation").queryEqual(toValue: toLocation)
        
        var toArray: [OfferPost]
        toArray = []
        
        queryByTo.observeSingleEvent(of: .value
            , with: { (snapshot) in
                if let value = snapshot.value as? NSDictionary{

                    let keys = value.allKeys
                    for key in keys{
                        let post = value[key] as! NSDictionary
                        toArray.append(OfferPost(username: post.value(forKey: "username") as! String, fromLocation: post.value(forKey: "fromLocation") as! String, toLocation: post.value(forKey: "toLocation") as! String, date: post.value(forKey: "date") as! String, time: post.value(forKey: "time") as! String, price: post.value(forKey: "price") as! String, phoneNumber: post.value(forKey: "phoneNumber") as! String, willStop: false, numSeats: post.value(forKey: "numSeats") as! String))
                    }
                    //print("TOARRAY", toArray)

                }
        })
        
        return Set(toArray)
    }
    
    
    func queryByDate(date:String) -> Set<OfferPost> {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        let queryByDate = ref.child("forms").queryOrdered(byChild: "date").queryEqual(toValue: date)
        
        var dateArray: [OfferPost]
        dateArray = []
        
        queryByDate.observeSingleEvent(of: .value
            , with: { (snapshot) in
                if let value = snapshot.value as? NSDictionary{

                    let keys = value.allKeys
                    for key in keys{
                        let post = value[key] as! NSDictionary
                        dateArray.append(OfferPost(username: post.value(forKey: "username") as! String, fromLocation: post.value(forKey: "fromLocation") as! String, toLocation: post.value(forKey: "toLocation") as! String, date: post.value(forKey: "date") as! String, time: post.value(forKey: "time") as! String, price: post.value(forKey: "price") as! String, phoneNumber: post.value(forKey: "phoneNumber") as! String, willStop: false, numSeats: post.value(forKey: "numSeats") as! String))

                    }
                    //print("DATEARRAY", dateArray)
                }
                
        })
        
        
        return Set(dateArray)
    }
    
    func combineSets(set1:Set<OfferPost>, set2:Set<OfferPost>, set3:Set<OfferPost>) -> Set<OfferPost> {
        let setFinal:Set<OfferPost> = set1.intersection(set2).intersection(set3)
        return setFinal
    }
    

    @IBAction func queryButtonPressed(_ sender: UIButton) {
        
        let fullDate = inputDateTimeTextField.text!
        let dateArr = fullDate.components(separatedBy: " ")
        let date = dateArr[0]
        let from = fromTextField.text!
        let to = toTextField.text!
        
        let fromSet = queryByFrom(fromLocation: from)
        let toSet = queryByTo(toLocation: to)
        let dateSet = queryByDate(date: date)
        
        let finalSet = combineSets(set1: fromSet, set2: toSet, set3: dateSet)
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
