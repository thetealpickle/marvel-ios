//
//  Model.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import Alamofire
import SwiftUI

class Model {
    static let instance = Model()
    
    let comicsUrl = "\(BASE_URL)\(API_VERSION)\(COMICS_URL)?apikey=\(API_KEY)"
    private(set) public var comics: [Comic] = []
    
    func getComics(completion: @escaping (Error?) -> Void) {
        
        let timestamp =  NSDate().timeIntervalSince1970
        let privateKey = "dec3ee9ef7483796740003e3517f9af4c1bb3369"
        let hashVal = "\(timestamp)\(privateKey)\(API_KEY)"
        
        let parameters: Parameters = [
            "apikey": API_KEY,
            "ts": timestamp,
            "hash": hashVal.md5
        ]
        let headers = HTTPHeaders([.accept("application/json")])
        
                DispatchQueue.main.async {
        AF.request("https://gateway.marvel.com:443/v1/public/comics",
                   parameters: parameters,
                   headers: headers).responseJSON { response in
                    
                    if let error = response.error {
                        DispatchQueue.main.async {
                            completion(error)
                        }
                        return
                    }
                    
                    guard let value = response.value as? [String:Any] else {  return }
                    guard let results = value["data"] as? [String:Any] else { return }
                    guard let resultsArray = results["results"] as? [Dictionary<String,Any>] else { return }
                    
                    self.comics = resultsArray.compactMap({
                        Comic(data: $0)
                    })
                    
                    DispatchQueue.main.async {
                        completion(nil)
                    }
        }
                }
        
    }
}
