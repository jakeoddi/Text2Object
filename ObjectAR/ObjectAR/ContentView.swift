//
//  ContentView.swift
//  ObjectAR
//
//  Created by Jake Oddi on 3/1/22.
//

import SwiftUI
import RealityKit
import ARKit
//import XCTest

struct ContentView : View {
    // create String array to store model names
    var models: [String] = ["toy_biplane", "fender_stratocaster"]
    
    var body: some View {
//        return ARViewContainer().edgesIgnoringSafeArea(.all)
        
        // new stack in Z dimension (in vs out)
        ZStack(alignment: .bottom) {
            // instantiate ARView
            ARViewContainer()
            
            // new scroll view to pick models from
            ScrollView(.horizontal, showsIndicators: false) {
                // new stack in horizontal dimension (left vs right)
                HStack(spacing: 30) {
                    // iterate through each model in `models`
                    ForEach(0 ..< self.models.count) {
                        // get index
                        index in
                        // check each model is being loaded
//                        Text(self.models[index])
                        
                        // button to select models
                        Button(action: {
                            print("DEBUG: selected model with name \(self.models[index])")
                        }) {
                           // get images for buttons
                            Image(uiImage:
                                    UIImage(named: self.models[index])!
                            ) // add attributes to image
                            .resizable()
                            .frame(width: 80, height: 80).aspectRatio(1/1, contentMode: .fit)
                        } // configure button style
                        .buttonStyle(PlainButtonStyle())
                        
                        
                    }
                }
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)

        // create sphere for testing
        let testSphere = MeshResource.generateSphere(radius: 0.05)
        let testMaterial = SimpleMaterial(color: .blue, roughness: 0, isMetallic: true)
        
        // create model entity
        let testSphereEntity = ModelEntity(mesh: testSphere, materials: [testMaterial]) // mesh is where obj will be added
        
        // create anchor
        let sphereAnchor = AnchorEntity(world: SIMD3(x: 0, y: 0, z: 0))
        sphereAnchor.addChild(testSphereEntity)
        
        // add anchor to scene
        arView.scene.addAnchor(sphereAnchor)

        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
.previewInterfaceOrientation(.landscapeRight)
        }
    }
}
#endif
