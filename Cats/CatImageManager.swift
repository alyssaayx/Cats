//
//  CatImageManager.swift
//  Cats
//
//  Created by rgs on 4/9/21.
//

import Foundation
import SwiftUI

class CatImageManager: ObservableObject {
    
    @Published var image: UIImage?
    
    func getCatImage() {
        let apiURL = URL(string: "https://thiscatdoesnotexist.com/")!
        let request = URLRequest(url: apiURL)
        
        image = nil 
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}
