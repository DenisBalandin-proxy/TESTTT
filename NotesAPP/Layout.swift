//
//  Layout.swift
//  NotesAPP
//
//  Created by Jorel on 18/04/2022.
//  Copyright © 2022 Jorel. All rights reserved.
//

import UIKit

class Lauout: UIView {
    
    
   
    
    
    let vc = ViewController()
    
  //  let mainTextView: UITextView = {
               
  //         let mainTextView = UITextView()
               
    //           return mainTextView
//               }()
    
    
    
    
    
    //   let view = UIView()
    
    
    
    
   
    
    
    
    
    
    func initialSetUp() {
    
    
              vc.mainTextView.text = vc.defaults.string(forKey: "mainText")
         vc.titleTextField.text = vc.defaults.string(forKey: "topText")
     

        vc.titleTextField.placeholder = "Название заметки"

           setCurrentDate()

        if vc.datePickField.text != nil || vc.datePickField.text != "" {
            vc.datePickField.text = vc.defaults.string(forKey: "dateField")
           }

        vc.mainTextView.text = vc.defaults.string(forKey: "mainText")
        vc.titleTextField.text = vc.defaults.string(forKey: "topText")



        //   view.backgroundColor = .white
           
           
           
          // datePickField.translatesAutoresizingMaskIntoConstraints = false
        vc.mainTextView.becomeFirstResponder()
        

        
    
    }
    
    
    
    
    
    
    
    
                    public func setCurrentDate() {
                 // var a = String()
                 let dateFormatter = DateFormatter()
                 dateFormatter.dateFormat = "MMMM d, YYYY"
                        vc.holderDate = dateFormatter.string(from: vc.date)
                        vc.datePickField.placeholder = "\(vc.holderDate)"
             }
    
    
    
    @objc func stopFocusing() {
      //  save()
    
    
   //     vc.mainTextView.text = vc.defaults.string(forKey: "mainText")
    //    vc.titleTextField.text = vc.defaults.string(forKey: "topText")

    //    var emptyCck = Model.EmptyCheck()
    //    emptyCck.empty = vc.mainTextView.text
   //     let val1 = emptyCck.empty
   //     emptyCck.empty = vc.titleTextField.text
   //     let val2 = emptyCck.empty

  //      if val1 == "Yes" && val2 == "Yes" {
   // //        vc.showEmptyNoteAlert(on: self)
   //     } else {
            vc.mainTextView.resignFirstResponder()
            vc.titleTextField.resignFirstResponder()
  //  }
    }

    @objc func save() {
        let mainText = vc.mainTextView.text
        let topView = vc.titleTextField.text
        let dateField = vc.datePickField.text
        vc.defaults.set(topView, forKey: "topText")
        vc.defaults.set(mainText, forKey: "mainText")
        vc.defaults.set(dateField, forKey: "dateField")
    }

    @objc func cancelAction() {
        vc.datePickField.resignFirstResponder()
    }

    @objc public func doneAction() {
        if let datePickerView = vc.datePickField.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, YYY"
            let dateString = dateFormatter.string(from: datePickerView.date)
            vc.datePickField.text = dateString
            vc.datePickField.resignFirstResponder()
        }
    }
    
}
    
    
