//
//  ImagePicker.swift
//  Instafilter
//
//  Created by 褚宣德 on 2023/10/31.
//
// MARK: -
//1. We created a SwiftUI view that conforms to UIViewControllerRepresentable.
//2. We gave it a makeUIViewController() method that created some sort of UIViewController, which in our example was a PHPickerViewController.
//3. We added a nested Coordinator class to act as a bridge between the UIKit view controller and our SwiftUI view.
//4. We gave that coordinator a didFinishPicking method, which will be triggered by iOS when an image was selected.
//5. Finally, we gave our ImagePicker an @Binding property so that it can send changes back to a parent view.

import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            guard let provider = results.first?.itemProvider else { return }
            
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    self.parent.image = image as? UIImage
                }
            }
        }
    }
    
    //    typealias UIViewControllerType = PHPickerViewController
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
