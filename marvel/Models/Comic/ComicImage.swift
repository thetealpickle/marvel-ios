//
//  ComicImage.swift
//  marvel
//
//  Created by Jessica Joseph on 3/26/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import Foundation

struct ComicImage: Codable {
    var path: String?
    var ext: String?
    
    init(from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy: ComicImageCodingKeys.self)
          
          self.path = try container.decodeIfPresent(String.self, forKey: .path)
          self.ext = try container.decodeIfPresent(String.self, forKey: .ext)
      }
    
    enum ComicImageCodingKeys: String, CodingKey{
        case path
        case ext = "extension"
    }
}
