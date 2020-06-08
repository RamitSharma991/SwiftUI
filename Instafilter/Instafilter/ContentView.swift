//
//  ContentView.swift
//  Instafilter
//
//  Created by Ramit sharma on 17/02/20.
//  Copyright © 2020 Ramit sharma. All rights reserved.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

class ImageSver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
    
}

struct ContentView: View {
    
    @State private var filterIntensity = 0.5
    // Wrapping a UIViewController in a SwiftUI view
    
    @State private var showingFilterSheet = false
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    
    let context = CIContext()
    let intensity = Binding<Double>(
        get: {self.filterIntensity},
        set: {
            self.filterIntensity = $0
            self.applyProcessing()
        }
    )
    
    
    
    var body: some View {
        
        
        VStack {
            ZStack {
                image?
                    .resizable()
                    .scaledToFit()
                
                Button("Select Image") {
                    self.showingImagePicker = true
                }
                Rectangle()
                    .fill(Color.secondary)
                
                if image != nil {
                    image!
                        .resizable()
                        .scaleToFit()
                    
                } else {
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
        
            .onTapGesture {
                self.showingImagePicker = true
            }
                
                HStack {
                    Text("Intensity")
                    Slider(value: intensity)
                }
                .padding(.vertical)
                
                HStack {
                    Button("Change Filter") {
                        // change filter
                        self.showingFilterSheet = true
                    }
                    Spacer()
                    Button("Save") {
                        // save the picture
                        guard let processedImage = self.processedImage else { return }
                        
                    
                        let imageSaver = ImageSaver()
                        
                        imageSaver.successHandler = {
                            print("Success!")
                        }
                        
                        imageSaver.errorHandler = {
                            print("Oops: \($0.localizedDescription)")
                        }
                        imageSaver.writeToPhotoAlbum(image: processedImage)
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle("InstaFilter")
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
             ImagePicker(image: self.$inputImage)
        }
        .actionSheet(sheet(isPresented: $showingFilterSheet) {

            ActionSheet(title: Text("Select a filter"), buttons: [.default(Text("Crystallize")) {self.setFilter(CIFilter.crystallize())},
                .default(Text("Edges")) { self.setFilter(CIFilter.edges())},
                .default(Text("Gaussian Blur")) {
                    self.setFilter(CIFilter.gaussianBlur()) }
                    .default(Text("Pixellate")) { self.setFilter(CIFilter.pixellate()) },
                .default(Text("Sepia Tone")) { self.setFilter(CIFilter.sepiaTone()) },
                .default(Text("Unsharp Mask")) { self.setFilter(CIFilter.unsharpMask()) },
                .default(Text("Vignette")) { self.setFilter(CIFilter.vignette()) },
                .cancel()
            ])
        }
        
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
        
        
//        image = Image(uiImage: inputImage)
        //   UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
//        let imageSaver = ImageSaver()
//        imageSaver.writeToPhotoAlbum(image: inputImage)
        
    }
    

func applyProcessing() {
  //  currentFilter.intensity = Float(filterIntensity)
  //  currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
    
    let inputKeys = currentFilter.inputKeys
    if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)}
    if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey)}
    if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)}
    guard let outputImage = currentFilter.outputImage else { return  }
    
    if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
        let uiImage = UIImage(cgImage: cgimg)
        image = Image(uiImage: uiImage)
        processedImage = uiImage
    }
    
}
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






/*
 struct ContentView: View {
 @State private var showingActionSheet = false
 @State private var backgroundColor = Color.white
 @State private var blurAmount: CGFloat = 0 {
 didSet {
 print("New value is \(blurAmount)")
 }
 }
 //Property wrappers have that name because they wrap our property inside another struct.
 
 var body: some View {
 let blur = Binding<CGFloat>(
 get: {
 self.blurAmount
 },
 set: {
 self.blurAmount = $0
 print("New value is \(self.blurAmount)")
 }
 )
 
 return VStack {
 Text("Hello, World!")
 .blur(radius: blurAmount)
 .frame(width: 300, height: 300)
 .background(backgroundColor)
 .onTapGesture {
 self.showingActionSheet = true
 }
 
 Slider(value: blur, in: 0...20)
 }
 }
 }
 
 */



/*
 
 
 Integrating Core Image with SwiftUI
 
 struct ContentView: View {
 @State private var image: Image?
 
 var body: some View {
 VStack {
 image?
 .resizable()
 .scaledToFit()
 }
 .onAppear(perform: loadImage)
 }
 
 func loadImage() {
 guard let inputImage = UIImage(named: "Example") else { return }
 let beginImage = CIImage(image: inputImage)
 
 
 let context = CIContext()
 let currentFilter = CIFilter.sepiaTone()
 currentFilter.inputImage = beginImage
 currentFilter.intensity = 1
 
 or
 
 let currentFilter = CIFilter.pixellate()
 currentFilter.inputImage = beginImage
 currentFilter.scale = 100
 
 or
 
 let currentFilter = CIFilter.crystallize()
 currentFilter.inputImage = beginImage
 currentFilter.radius = 200
 
 or
 
 let currentFilter = CIFilter.crystallize()
 currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
 currentFilter.radius = 200
 
 
 
 or
 
 guard let currentFilter = CIFilter(name: "CITwirlDistortion") else { return }
 currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
 currentFilter.setValue(2000, forKey: kCIInputRadiusKey)
 currentFilter.setValue(CIVector(x: inputImage.size.width / 2, y: inputImage.size.height / 2), forKey: kCIInputCenterKey)
 
 guard let outputImage = currentFilter.outputImage else { return }
 
 // attempt to get a CGImage from our CIImage
 if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
 // convert that to a UIImage
 let uiImage = UIImage(cgImage: cgimg)
 
 // and convert that to a SwiftUI image
 image = Image(uiImage: uiImage)
 }
 }
 
 */

















