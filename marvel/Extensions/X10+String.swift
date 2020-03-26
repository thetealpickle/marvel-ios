//
//  X10+String.swift
//  marvel
//
//  Created by Jessica Joseph on 3/26/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import CommonCrypto
import Foundation

extension String {
    var md5: String {
        let data = Data(self.utf8)
        let hash = data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) -> [UInt8] in
            var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
            CC_MD5(bytes.baseAddress, CC_LONG(data.count), &hash)
            return hash
        }
        return hash.map { String(format: "%02x", $0) }.joined()
    }
}
