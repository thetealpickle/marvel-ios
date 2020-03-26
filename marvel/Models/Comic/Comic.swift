//
//  Comic.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import Alamofire
import Combine
import UIKit

class Comic: ObservableObject {
    @Published var image: UIImage? = nil
    
    var id: Int?
    
    var description: String?
    var title: String?
    
    
    
    init(data: Dictionary<String, Any>) {
        guard
            let description = data["description"] as? String,
            let id = data["id"] as? Int,
            let title = data["title"] as? String
            else { return }
        
        self.id = id
        self.title = title
        self.description = description
        
        print("aoenvfojnrae k r \(data["thumbnail"] ?? "NO THUMB")")
        
//        if let thumbnail = data["thumbnail"] {
            
//            let urlString = "\(thumbnail)"
            
//            DispatchQueue.main.async {
//                AF.request("https://gateway.marvel.com:443/v1/public/comics",
//                           parameters: parameters,
//                           headers: headers).responseJSON { response in
//
//            }
//        } else {
            self.image = nil
//        }
    }
}
