//
//  Model.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import SwiftUI

class Model {
    static let instance = Model()
    
    private var apiKey: String? = "4c7c8b0a5e0d5391e27cd2c74b0207a6"
    private var privateKey: String? = "dec3ee9ef7483796740003e3517f9af4c1bb3369"
    
    private(set) public var comics: [Comic] = []
    
    
    
    
    func getComics(completion: @escaping (_ success: Bool,_ error: Error?) -> Void) {
        
        guard let comicsUrl = getURLFor(.comic) else {
            completion(false, nil)
            return
        }
        
        let urlConfig = URLSessionConfiguration.default
        let urlSession = URLSession.init(configuration: urlConfig,
                                         delegate: nil,
                                         delegateQueue: .main)
        
        print(comicsUrl)
        
        let task = urlSession.dataTask(with: comicsUrl) { (data, response, error) in
            if let err = error {
                debugPrint("[NETWORKING ERR]: \(err)")
                completion(false, err)
            } else if let data = data {
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data) as? Dictionary<String, Any> {
                        
                        if let jsonData = json["data"] as? Dictionary<String, Any> {
                            if let results = jsonData["results"] as? Array<Dictionary<String, Any>> {
                                let jsonDecoder = JSONDecoder()
                                
                                self.comics = try results.map({
                                    
                                    let comicData = try JSONSerialization.data(withJSONObject: $0, options: [])
                                    return try jsonDecoder.decode(Comic.self, from: comicData)
                                })
                                
                                self.comics.sort(by: { $0.title! < $1.title!})
                                
                                completion(true, nil)
                            }
                        }
                    }
                } catch {
                    debugPrint("[JSON ERR]: Could not deserialize JSON")
                    completion(false, nil)
                }
            }
            completion(false, nil)
        }
        
        task.resume()
    }
    
    // MARK: Private Helper Methods
    private func appendParametersToURLString(_ urlString: inout String) {
        guard let apiKey = self.apiKey else { return }
        guard let privateKey = self.privateKey else { return }
        
        
        let timestamp =  NSDate().timeIntervalSince1970
        let hashVal = "\(timestamp)\(privateKey)\(apiKey)"
        
        let parameters: Dictionary<String, Any> = [
            "apikey": apiKey,
            "ts": timestamp,
            "hash": hashVal.md5
        ]
        
        urlString.append("?")
        
        for parameter in parameters {
            urlString.append("\(parameter.key)=\(parameter.value)&")
        }
        
        urlString.removeLast()
    }
    
    private func getURLFor(_ urlType: MarvelURLType) -> URL? {
        var urlString = "\(BASE_URL)\(API_VERSION)\(urlType.rawValue)"
        appendParametersToURLString(&urlString)
        
        return URL(string: urlString)
    }
}

