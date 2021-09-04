//
//  CatImageView.swift
//  Cats
//
//  Created by rgs on 4/9/21.
//

import SwiftUI

struct CatImageView: View {
    
    @ObservedObject var catImageManager = CatImageManager()
    
    var body: some View {
        VStack {
            if let image = catImageManager.image {
                Image(uiImage: image)
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
        .onAppear {
            catImageManager.getCatImage()
        }
    }
}
struct CatImageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CatImageView()
        }
    }
}

