//
//  ViewController.swift
//  SpinningCoin
//
//  Created by Abhishek Ranjan on 04/18/22.
//  Copyright © 2018 Abhishek Ranjan. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: SCNView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var thirdImageView: UIView!
    
    @IBOutlet weak var frameView: UIView!
    
    @IBOutlet weak var frame1View: UIView!
    @IBOutlet weak var frame2View: UIView!
    @IBOutlet weak var frame3View: UIView!
    
    @IBOutlet weak var buttonLeading: NSLayoutConstraint!

    var imagePlaneNode = SCNNode()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.isUserInteractionEnabled = true
        sceneView.backgroundColor = UIColor.clear
        sceneView.autoenablesDefaultLighting = false
        
        imageView.layer.cornerRadius = imageView.frame.height / 2
        frameView.layer.cornerRadius = frameView.frame.height / 2
        
        thirdImageView.layer.cornerRadius = thirdImageView.frame.height / 2
        
        frame1View.layer.cornerRadius = (frame1View.frame.width - frame1View.frame.height) + 5
        frame1View.layer.borderWidth = 5.0
        frame1View.layer.borderColor = UIColor.black.cgColor
        
        frame2View.layer.cornerRadius = frame2View.frame.height / 2
        frame2View.layer.borderWidth = 5.0
        frame2View.layer.borderColor = UIColor.black.cgColor
        
        frame3View.layer.cornerRadius = frame3View.frame.height / 2
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        imagePlaneSetup()
        
//        UIView.animate(withDuration: 1.0, delay: 0.1, options: [.repeat, .curveEaseOut, .autoreverse], animations: {
//            // animation
//            let randomInt = Int.random(in: 5...10)
//            self.buttonLeading.constant = CGFloat(randomInt)
//        }, completion: { finished in
//            // completion
//        })
    }
    
    func imagePlaneSetup() {
        
        let coinScene = SCNScene()
        imagePlaneNode = SCNNode(geometry: SCNPlane(width: 10, height: 10.0))
        //imagePlaneNode.position = SCNVector3Make(50, 50, 50)
        //imagePlaneNode = SCNNode(geometry:SCNBox(width: 1.0, height: 0.5, length: 2.0, chamferRadius: 0.0))
        
        
        let shinyCoinMaterial = SCNMaterial()
        shinyCoinMaterial.diffuse.contents = frameView
        shinyCoinMaterial.specular.contents = UIColor.clear
        shinyCoinMaterial.shininess = 1
        imagePlaneNode.geometry!.firstMaterial = shinyCoinMaterial
        imagePlaneNode.geometry!.firstMaterial!.isDoubleSided = false
        coinScene.rootNode.addChildNode(imagePlaneNode)
        
        let camera = SCNCamera ()
        let cameraNode = SCNNode ()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3Make(0, 0, 10) // set your camera position
        coinScene.rootNode.addChildNode(cameraNode)
        sceneView.scene = coinScene //add scene to your SCNView
        
        
        sceneView.autoenablesDefaultLighting = false
        sceneView.allowsCameraControl = true
        sceneView.defaultCameraController.interactionMode = .orbitTurntable
        sceneView.defaultCameraController.inertiaEnabled = true
        sceneView.defaultCameraController.maximumVerticalAngle = 70
        sceneView.defaultCameraController.minimumVerticalAngle = -70
        sceneView.defaultCameraController.maximumHorizontalAngle = 70
        sceneView.defaultCameraController.minimumHorizontalAngle = -70
        

        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture))
        sceneView.addGestureRecognizer(pinchRecognizer)
    }
    
    @objc func pinchGesture(_ sender: UIPinchGestureRecognizer) {
          if sender.numberOfTouches == 2 {
              // Disable zoom
              print("zoom attempted")
          }
      }
    
    
}

