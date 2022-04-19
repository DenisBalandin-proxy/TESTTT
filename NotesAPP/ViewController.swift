//
//  ViewController.swift
//  NotesAPP
//
//  Created by Jorel on 30/03/2022.
//  Copyright © 2022 Jorel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {



        let date = Date()
    var holderDate = String()
    
    
    let model = Model()
       

 let mainTextView: UITextView = {
            
        let mainTextView = UITextView()
            mainTextView.translatesAutoresizingMaskIntoConstraints = false
            return mainTextView
            
            }()
    
    let titleTextField: UITextField = {
         let titleTextField = UITextField()
         titleTextField.translatesAutoresizingMaskIntoConstraints = false

         return titleTextField
     }()

    
    let datePickField = UITextField()
    

    public let defaults = UserDefaults.standard
    
    
    
    public let myButton = UIBarButtonItem()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        

    }
        
        
         public func setCurrentDate() {
               // var a = String()
               let dateFormatter = DateFormatter()
               dateFormatter.dateFormat = "MMMM d, YYYY"
               holderDate = dateFormatter.string(from: date)
               datePickField.placeholder = "\(holderDate)"
           }

        
        
        
        
        
    
    override func loadView() {
       self.view = Lauout()
        
        
        
        
              mainTextView.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
                titleTextField.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 22)

                let notificationCenter = NotificationCenter.default
                notificationCenter.addObserver(
                    self,
                    selector: #selector(save),
                    name: UIApplication.willTerminateNotification,
                    object: nil
                )
                let myButton = UIBarButtonItem(title: "Готово", style: .plain, target: self, action: #selector(stopFocusing))

         self.titleTextField.placeholder = "Название заметки"

                setCurrentDate()

                if datePickField.text != nil || datePickField.text != "" {
                   datePickField.text = defaults.string(forKey: "dateField")
                }

                mainTextView.text = defaults.string(forKey: "mainText")
                titleTextField.text = defaults.string(forKey: "topText")



             //   view.backgroundColor = .white
                navigationItem.rightBarButtonItem = myButton
                
                
               // datePickField.translatesAutoresizingMaskIntoConstraints = false
                mainTextView.becomeFirstResponder()
         
         
         
          view().setConstraints()
         view().button()
         
        
    }
    
    
    func view() -> Lauout {
       return self.view as! Lauout
    }
    
    
    
    
    
    @objc public func stopFocusing() {
            save()
        
        
            mainTextView.text = defaults.string(forKey: "mainText")
            titleTextField.text = defaults.string(forKey: "topText")

            var emptyCck = Model.EmptyCheck()
            emptyCck.empty = mainTextView.text
            let val1 = emptyCck.empty
            emptyCck.empty = titleTextField.text
            let val2 = emptyCck.empty

            if val1 == "Yes" && val2 == "Yes" {
                showEmptyNoteAlert(on: self)
            } else {
                mainTextView.resignFirstResponder()
                titleTextField.resignFirstResponder()
            }
        }

        @objc func save() {
            let mainText = mainTextView.text
            let topView = titleTextField.text
            let dateField = datePickField.text
            defaults.set(topView, forKey: "topText")
            defaults.set(mainText, forKey: "mainText")
            defaults.set(dateField, forKey: "dateField")
        }

        @objc func cancelAction() {
            self.datePickField.resignFirstResponder()
        }

        @objc public func doneAction() {
            if let datePickerView = datePickField.inputView as? UIDatePicker {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMM d, YYY"
                let dateString = dateFormatter.string(from: datePickerView.date)
                datePickField.text = dateString
                datePickField.resignFirstResponder()
            }
        }
    
    
    
    
    func doAction() {
        
         if let datePickerView = datePickField.inputView as? UIDatePicker {
                       let dateFormatter = DateFormatter()
                       dateFormatter.dateFormat = "MMM d, YYY"
                       let dateString = dateFormatter.string(from: datePickerView.date)
                       self.datePickField.text = dateString
                       self.datePickField.resignFirstResponder()
        
        
    }
    
    
    
    }
}



    extension UIViewController {
        func showAlertt(on viewController: UIViewController, with title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            DispatchQueue.main.async {
                viewController.present(alert, animated: true, completion: nil)
            }
        }
        func showEmptyNoteAlert (on viewController: UIViewController) {
            showAlertt(on: viewController, with: "ERROR", message: "Your note is empty!")
        }
    }
