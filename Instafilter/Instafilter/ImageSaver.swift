//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Ramit sharma on 02/03/20.
//  Copyright © 2020 Ramit sharma. All rights reserved.
//

import UIKit

class ImageSAver: NSObject {
    
    var successHandler: (() -> Void)?
    var errorHandler:((Error) -> Void)?
     
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        //
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
