//
//  Meal.swift
//  FoodTracker
//
//  Created by Yuri Kasperovich on 6/13/16.
//  Copyright © 2016 Yuri Kasperovich. All rights reserved.
//

import UIKit

class Meal {
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
}

