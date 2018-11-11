//
//  DataManager.swift
//  app-listy
//
//  Created by Alexandre Gravelle on 2018-11-11.
//  Copyright © 2018 Alexandre Gravelle. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    
    static let instance = DataService()
    
    private var camera = UIImage(named: "pexels-photo-6")!
    private var city = UIImage(named: "pexels-photo-5")!
    private var animals = UIImage(named: "pexels-photo-4")!
    private var flower = UIImage(named: "pexels-photo-3")!
    private var stand = UIImage(named: "pexels-photo-2")!
    private var urban = UIImage(named: "pexels-photo-1")!
    
    func getItemsImageArray() -> [UIImage] {
        return [camera, city, animals, flower, stand, urban]
    }
    
    func getItemsNameArray() -> [String] {
        return ["CAMERAS", "CITY", "ANIMALS", "FLOWERS", "STANDS", "URBAN"]
    }
    
}
