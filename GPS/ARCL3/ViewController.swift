//
//  ViewController.swift
//  ARCL3
//
//  Created by Jenna Sun on 11/6/19.
//  Copyright © 2019 Jenna Sun. All rights reserved.
//

import UIKit
import ARCL
import CoreLocation
import SceneKit
import ARKit

class ViewController: UIViewController {
    
    var sceneLocationView = SceneLocationView()
    
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        
        sceneView.session.run(configuration)
        
        
        // Do any additional setup after loading the view.
//        sceneLocationView.run()
//        view.addSubview(sceneLocationView)
    }
    
    @IBAction func AddCube(_ sender: Any) {
        let cubeNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length:0.1, chamferRadius:0))
//        cubeNode.position = SCNVector3(0,0, -0.2) //iin meters
//        sceneView.scene.rootNode.addChildNode(cubeNode)
        let cc = getCameraCoordinates(sceneView: sceneView)
        cubeNode.position = SCNVector3(cc.x, cc.y, cc.z)
        
        sceneView.scene.rootNode.addChildNode(cubeNode)

        
    }
    struct myCameraCoordinates{
        var x = Float()
        var y = Float()
        var z = Float()
    }
    
    func getCameraCoordinates(sceneView: ARSCNView)->myCameraCoordinates{
        let cameraTransform = sceneView.session.currentFrame?.camera.transform
        let cameraCoordinates = MDLTransform(matrix: cameraTransform!)
        var cc = myCameraCoordinates()
        cc.x = cameraCoordinates.translation.x
        cc.y = cameraCoordinates.translation.y
        cc.z = cameraCoordinates.translation.z
        
        return cc
        
    }
    
//    @IBAction func AddBox(_ sender: Any) {
//        let cubeNode = SCNBox(width: 0.1, height: 0.1, length:0.1, chamferRadius:0)
//        let node=SCNNode(geometry: cubeNode)
//        node.position = SCNVector3(0,0,0)
//        sceneView.scene.rootNode.addChildNode(node)
//
//    }
    @IBAction func AddCup(_ sender: Any) {
    }
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        sceneLocationView.frame = view.bounds
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
////      first node
//        var location = CLLocation(coordinate: CLLocationCoordinate2D(latitude:42.360081, longitude: -71.058884), altitude: 30)
//
//        var pin = UIImage(named: "BU_logo")!
//
//        var annotationNode = LocationAnnotationNode(location: location, image: pin)
//        
//        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode)
//
////second node
//
//    }
}

