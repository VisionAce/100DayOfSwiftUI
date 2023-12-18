//
//  Dice.swift
//  RollDice
//
//  Created by 褚宣德 on 2023/12/17.
//

import SwiftUI
import SceneKit
import SpriteKit

struct TetrahedronView: UIViewRepresentable {
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        let scene = SCNScene()

        // 创建正四面体几何体
        let tetrahedronGeometry = SCNPyramid(width: 1.0, height: 1.0, length: 1.0)
        let tetrahedronNode = SCNNode(geometry: tetrahedronGeometry)
        tetrahedronNode.rotation = SCNVector4(x: 1, y: 0, z: 0, w: .pi / 4) // 旋转45度以显示一个面

        // 将节点添加到场景中
        scene.rootNode.addChildNode(tetrahedronNode)

        // 设置场景视图
        sceneView.scene = scene
        sceneView.backgroundColor = .clear
        sceneView.autoenablesDefaultLighting = true

        return sceneView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {
        // 更新视图
    }
}


struct NumberedCubeView: View {
    @State private var rotation: Angle = .zero

    var body: some View {
        VStack {
            Spacer()

            GeometryReader { geometry in
                SpriteView(scene: {
                    let scene = SKScene(size: geometry.size)
                    scene.scaleMode = .resizeFill

                    // 创建每个面上的文本标签
                    for faceIndex in 0..<6 {
                        let labelNode = createLabelNode(for: faceIndex + 1)
                        labelNode.position = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
                        labelNode.zRotation = CGFloat(faceIndex) * CGFloat.pi / 3.0
                        scene.addChild(labelNode)
                    }

                    return scene
                }())
                .gesture(
                    RotationGesture()
                        .onChanged { angle in
                            rotation = angle
                        }
                )
                .rotationEffect(rotation)
            }

            Spacer()
        }
    }

    private func createLabelNode(for number: Int) -> SKLabelNode {
        let labelNode = SKLabelNode(text: "\(number)")
        labelNode.fontName = "Helvetica-Bold"
        labelNode.fontSize = 24
        labelNode.fontColor = .white
        return labelNode
    }
}



struct ContentView2: View {
    var body: some View {
        VStack {

            NumberedCubeView()
                    .frame(width: 500, height: 500)
                    .padding(100)
                    
        }
        .background(.blue)
        
    }
}

#Preview("ContentView2") {
    ContentView2()
}

