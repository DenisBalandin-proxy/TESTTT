//
//  Model.swift
//  NotesAPP
//
//  Created by Jorel on 18/04/2022.
//  Copyright © 2022 Jorel. All rights reserved.
//

import UIKit







class Model: UIView {
    
    
    struct valuesForApp {
    
        var title, dateHolder, textMain: String
        
        
    }
    
        struct EmptyCheck {
        var emptyState = String()
        var emptyString = String()
        var empty: String? {
            get {
                return emptyState
            }
            set (newValue) {
                if newValue?.isEmpty ?? true {
                    emptyState = "Yes"
                } else {
                    emptyState = "No"
                }
            }
        }
    }
    
    

}
