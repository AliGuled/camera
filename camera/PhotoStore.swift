//
//  PhotoStore.swift
//  camera
//
//  Created by Guled Ali on 3/26/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import Foundation
import UIKit

class PhotoStore {
    
    let imageURL: URL = {
        let imageFileName = "hello_camera"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectory.first!
        return documentDirectory.appendingPathComponent(imageFileName)
        

    }()
    
    func savePhoto(image: UIImage) {
        if let data = image.jpegData(compressionQuality: 1) {
            try? data.write(to: imageURL, options: [.atomic])
        }
        
    }
    
    func getPhoto() -> UIImage? {
        guard let imageFromDisk = UIImage(contentsOfFile: imageURL.path) else{
            return nil
        }
        return imageFromDisk
    }
    
    
}
