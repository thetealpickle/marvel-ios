//
//  ComicCycleButton.swift
//  marvel
//
//  Created by Jessica Joseph on 3/26/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import SwiftUI

struct ComicCycleButton: View {
    var type: ComicCycleType
    
    var body: some View {
        GeometryReader { (container: GeometryProxy) in
            Button(action: {
                
            }) {
                Text(self.type.rawValue.uppercased())
                    .font(getHeadlineFontWithContainerSize(container.size.width * 2.0))
                .fixedSize(horizontal: true, vertical: false)
            }
            .frame(width: container.size.width,
                   height: container.size.height)
            .background(Color("SecondarySystemColor"))
            .foregroundColor(Color("PrimaryTextColor"))
                .cornerRadius(container.size.height * 0.2)
        }
    }
}

struct ComicCycleButton_Previews: PreviewProvider {
    static var previews: some View {
        ComicCycleButton(type: .previous)
    }
}
