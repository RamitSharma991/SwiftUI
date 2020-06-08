//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Ramit sharma on 20/02/20.
//  Copyright © 2020 Ramit sharma. All rights reserved.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
//“delegates” are objects that respond to events that occur elsewhere

        class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
            var parent: ImagePicker
            
            init(_ parent: ImagePicker) {
                self.parent = parent
            }
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                
                if let uiImage = info[.originalImage] as?
                    UIImage {
                    parent.image = uiImage
                }
                parent.presentationMode.wrappedValue.dismiss()
            }
            
    }
    

        
        @Binding var image: UIImage?
        @Environment(\.presentationMode) var presentationMode


        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
    
      func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        //
         
    }
    
 //   typealias UIViewControllerType = UIImagePickerController
}
