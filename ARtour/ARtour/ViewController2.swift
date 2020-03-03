//
//  ViewController.swift
//  ARtour
//
//  Created by Sebastian Nevarez on 11/6/19.
//  Copyright © 2019 SeniorDesign. All rights reserved.
//

import ARKit
import RealityKit
import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD:ARtour/ARtour/ViewController.swift
        addArrow()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
=======
        
        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
//        arView.scene.anchors.append(boxAnchor)
>>>>>>> origin/master+branch2:ARtour/ARtour/ViewController2.swift
    }
    
    func addArrow() {
        let scene = SCNScene()
        let arrowScene = SCNScene(named: "arrow.dae")
        guard let arrowNode = arrowScene?.rootNode.childNode(withName: "arrow", recursively: true) else {fatalError("arrow not found")}
        arrowNode.position = SCNVector3(0, -0.5, -2.0)
        scene.rootNode.addChildNode(arrowNode)
        sceneView.scene = scene
    }
    
//    @IBAction func showInfo(_ sender: Any) {
//
//        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "arPopUpView") as! BeaconViewController
//        self.addChild(popOverVC)
//        popOverVC.view.frame = self.view.frame
//        self.view.addSubview(popOverVC.view)
//        popOverVC.didMove(toParent: self)
//    }
    
}
