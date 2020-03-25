//
//  ComicDetailSubdataView.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import SwiftUI

struct ComicDetailSubdataView: View {
    var title: String
    
    init(title: String) {
        self.title = title.uppercased()
    }
    
    var body: some View {
        Text(self.title)
    }
}

struct ComicDetailSubdataView_Previews: PreviewProvider {
    static var previews: some View {
        ComicDetailSubdataView(title: "Cover")
    }
}
