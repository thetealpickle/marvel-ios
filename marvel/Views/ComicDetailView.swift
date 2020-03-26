//
//  ComicDetailView.swift
//  marvel
//
//  Created by Jessica Joseph on 3/25/20.
//  Copyright © 2020 JESSICA JEAN JOSEPH. All rights reserved.
//

import SwiftUI

struct ComicDetailView: View {
    @Environment(\.presentationMode) var presentation
    
    var comic: Comic
    
    var body: some View {
        GeometryReader { (container: GeometryProxy) in
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.presentation.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .padding()
                        .frame(width: container.size.width * 0.12)
                        .foregroundColor(Color("PrimaryTextColor"))
                    }
                    .frame(height: container.size.height * 0.1)
                    .padding(.horizontal)
                    ScrollView(.vertical, showsIndicators: false) {
                        ComicDetailHeaderView()
                            .environmentObject(self.comic)
                            .frame(height: container.size.height * 0.3)
                        ComicDetailMetadataView()
                            .environmentObject(self.comic)
                            .frame(height: container.size.height * 0.5)
                        ComicDetailCycleBarView()
                        .frame(height: container.size.height * 0.1)
                        Spacer()
                    }
            }
            .padding(.vertical, container.size.height * 0.08)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("PrimarySystemColor"))
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ComicDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ComicDetailView(comic: SampleData.instance.comics[0])
    }
}
