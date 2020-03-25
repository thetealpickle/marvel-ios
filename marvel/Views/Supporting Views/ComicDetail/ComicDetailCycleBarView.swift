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
            HStack {
                Text("Previous")
                    .padding()
                Spacer()
                Text("Next")
                .padding()
                
            }
        .padding()
        }
    }
}

struct ComicDetailCycleBarView_Previews: PreviewProvider {
    static var previews: some View {
        ComicDetailCycleBarView()
    }
}
