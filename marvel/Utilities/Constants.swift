//
//  Constant.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import SwiftUI

// MARK: - Networking
let BASE_URL = "https://gateway.marvel.com:443/"
let API_VERSION = "v1"

enum MarvelURLType: String {
    case comics = "/public/comics"
}

// MARK: - Font Stylizing
let HEADLINE_FONT = "Roboto-Black"
let BODY_FONT = "Roboto-Regular"

let HEADLINE_FONT_WIDTH_SCALE: CGFloat = 0.06
let BODY_FONT_WIDTH_SCALE: CGFloat = 0.04

func getHeadlineFontWithContainerSize(_ size: CGFloat) -> Font {
    let scaledSize = UIFontMetrics.default.scaledValue(for: (size * HEADLINE_FONT_WIDTH_SCALE))
    return Font.custom(HEADLINE_FONT, size: scaledSize)
}

func getBodyFontWithContainerSize(_ size: CGFloat) -> Font {
    let scaledSize = UIFontMetrics.default.scaledValue(for: (size * BODY_FONT_WIDTH_SCALE))
    return Font.custom(BODY_FONT, size: scaledSize)
}

