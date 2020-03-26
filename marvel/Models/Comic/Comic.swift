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
        
        
        
        if let thumb = data["thumbnail"] as? Dictionary<String, Any>{
            guard let base = thumb["path"] as? String,
                let ext = thumb["extension"] as? String
                else {
                    self.image = nil
                    return
            }
            
            let imageUrl = "\(base).\(ext)"
            
            
            DispatchQueue.main.async {
                
                if let data = try? Data(contentsOf: URL(string: imageUrl)!),
                    let uiImage = UIImage(data: data) {
                    self.image = uiImage
                } else {self.image = nil}
                
                //            DispatchQueue.main.async {
                //                AF.request(thumbnailUrl).response { response in
                //                    if response.error != nil {
                //                        debugPrint(error)
                //                        self.image = nil
                //                        return
                //                    }
                //                    let imageData = Data(
                //                        self.image =
                //                }
                //            }
            }
        } else {
            self.image = nil
            //        }
        }
    }
    
    init(id: Int, title: String, description: String) {
       
        self.id = id
        self.title = title
        self.description = description
        
        let imageUrl = "http://i.annihil.us/u/prod/marvel/i/mg/9/30/4bc64df4105b9.jpg"

        if let data = try? Data(contentsOf: URL(string: imageUrl)!),
            let uiImage = UIImage(data: data) {
            self.image = uiImage
        } else {self.image = nil}
        
    }
}
