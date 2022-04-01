//
//  ViewController.swift
//  NotesAPP
//
//  Created by Jorel on 30/03/2022.
//  Copyright © 2022 Jorel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
private let textView = UITextView()
private let defaults = UserDefaults.standard
private let textField = UITextField()
 
private let myButton = UIBarButtonItem()
private let titleField = UITextField()
private let mainTextView: UITextView = {
            
        let mainTextView = UITextView()
            mainTextView.translatesAutoresizingMaskIntoConstraints = false
            return mainTextView
            
            }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTextView.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        textField.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 22)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(Save), name: UIApplication.willTerminateNotification, object: nil)
        
        let myButton = UIBarButtonItem(title: "Готово", style: .plain, target: self, action: #selector(stopFocusing))
        
        textField.frame = CGRect(x: 0, y: 0, width:(self.navigationController?.navigationBar.frame.size.width)!, height: 30)
        textField.placeholder = "Название заметки"
        self.navigationItem.titleView = textField
        
        mainTextView.text = defaults.string(forKey: "mainText")
        textField.text = defaults.string(forKey: "topText")
         
             view.addSubview(mainTextView)
             view.addSubview(titleField)
             view.addSubview(textView)
       
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = myButton
        setConstraints()
        titleField.translatesAutoresizingMaskIntoConstraints = false
        mainTextView.becomeFirstResponder()
        
    }

    private func setConstraints(){
        mainTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        mainTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        mainTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }

    @objc func stopFocusing(){
        
        
        mainTextView.resignFirstResponder()
        textField.resignFirstResponder()
    
    }
        
   @objc func Save(){
    
   let mainText = mainTextView.text
   let topView = textField.text
   defaults.set(topView, forKey: "topText")
   defaults.set(mainText, forKey: "mainText")
    
    }
}

