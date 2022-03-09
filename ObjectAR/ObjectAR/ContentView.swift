//
//  ContentView.swift
//  ObjectAR
//
//  Created by Jake Oddi on 3/1/22.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
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
        
//
//        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience.loadBox()
//
//        // Add the box anchor to the scene
//        arView.scene.anchors.append(boxAnchor)
//
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
