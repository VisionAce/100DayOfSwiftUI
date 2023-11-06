//
//  ImageSaver.swift
//  Instafilter
//
//  Created by 褚宣德 on 2023/11/6.
//

import UIKit

class ImageSaver: NSObject {
    func writeToPhotoALbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}
