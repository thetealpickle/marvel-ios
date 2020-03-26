//
//  Constant.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import SwiftUI

// MARK: Font Stylizing

let HEADLINE_FONT = "Roboto-Black"
let BODY_FONT = "Roboto-Regular"

let HEADLINE_FONT_WIDTH_SCALE: CGFloat = 0.6
let BODY_FONT_WIDTH_SCALE: CGFloat = 0.9

func getHeadlineFontWithContainerSize(_ size: CGFloat) -> Font {
    let scaledSize = UIFontMetrics.default.scaledValue(for: (size * HEADLINE_FONT_WIDTH_SCALE))
    return Font.custom(HEADLINE_FONT, size: scaledSize)
}

func getBodyFontWithContainerSize(_ size: CGFloat) -> Font {
    let scaledSize = UIFontMetrics.default.scaledValue(for: (size * BODY_FONT_WIDTH_SCALE))
    return Font.custom(BODY_FONT, size: scaledSize)
}

// MARK: Networking
let BASE_URL = "https://gateway.marvel.com:443/"
let API_VERSION = "v1"
let COMICS_URL = "/public/comics"


let API_KEY = "4c7c8b0a5e0d5391e27cd2c74b0207a6"
