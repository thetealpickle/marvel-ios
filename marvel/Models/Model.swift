//
//  Model.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import SwiftUI

/// Manages all model data and associated operations such as fetching and  uploading
class Model {
    static let instance = Model()
    
    private var apiKey: String? = "YOUR_API_KEY_HERE"
    private var privateKey: String? = "YOUR_PRIVATE_KEY_HERE"
    
    private(set) public var comics: [Comic] = []
    
    // MARK: - Data Fetching
    // MARK: [Fetch] Comics
    
    /// Fetches a list of public comics over the network
    /// - Parameter completion: a callback closure with a boolean  parameter denoting data download success and an optional error parameter
    func getComics(completion: @escaping (_ success: Bool,_ error: Error?) -> Void) {
        #if targetEnvironment(simulator)
        self.comics = SampleData.instance.comics
        completion(true, nil)
        
        #else
        guard let comicsUrl = getURLFor(.comics) else {
            completion(false, nil)
            return
        }
        
        let urlConfig = URLSessionConfiguration.default
        let urlSession = URLSession.init(configuration: urlConfig,
                                         delegate: nil,
                                         delegateQueue: .main)
                
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
                                
                                self.comics = self.comics.filter({
                                    guard $0.title != nil else { return false}
                                    guard $0.description != nil else { return false }
                                    
                                    return true
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
        #endif
    }
    
    // MARK: - Private Helper Methods
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
    
    /// Creates a URL
    /// - Parameter urlType: the type of url to be created
    /// - Returns: an optional URL
    private func getURLFor(_ urlType: MarvelURLType) -> URL? {
        var urlString = "\(BASE_URL)\(API_VERSION)\(urlType.rawValue)"
        appendParametersToURLString(&urlString)
        
        return URL(string: urlString)
    }
}

