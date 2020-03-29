//
//  ComicDetailCycleBarView.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import SwiftUI

struct ComicDetailCycleBarView: View {
    var body: some View {
        GeometryReader { (container: GeometryProxy) in
            HStack(alignment: .center,
                   spacing: container.size.width * 0.3) {
                ComicCycleButton(type: .previous)
                ComicCycleButton(type: .next)
            }
            .padding()
        .background(Color("PrimarySystemColor"))
        }
    }
}

struct ComicDetailCycleBarView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { (container: GeometryProxy) in
            ComicDetailCycleBarView()
                .frame(width: container.size.width,
                       height: container.size.height * 0.1)
        }
    }
}
