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
            ZStack(alignment: .bottom) {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                self.presentation.wrappedValue.dismiss()
                            }) {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                            }
                            .frame(width: container.size.width * 0.12)
                            .foregroundColor(Color("PrimaryTextColor"))
                            .padding()
                        }
                        ComicDetailHeaderView()
                            .environmentObject(self.comic)
                            .frame(height: container.size.height * 0.3)
                        
                        VStack(alignment: .leading) {
                            Text(self.comic.title ?? "Comic Title")
                                .font(getHeadlineFontWithContainerSize(container.size.width))
                            RoundedRectangle(cornerRadius: 30.0)
                                .frame(height: 1.5)
                                .padding(.bottom, container.size.height * 0.025)
                            Text(self.comic.description ?? "Comic Description")
                                .font(getBodyFontWithContainerSize(container.size.width))
                                .lineSpacing(container.size.height * 0.015)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.bottom, container.size.height * 0.025)
                        }
                        .padding()
                        .foregroundColor(Color("PrimaryTextColor"))
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                ComicDetailCycleBarView()
                    .frame(height: container.size.height * 0.1)
            }
            .padding(.vertical, container.size.height * 0.075)
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
