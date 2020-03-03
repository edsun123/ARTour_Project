//
//  ViewController.swift
//  Test1
//
//  Created by Adiran Martinez on 2/25/20.
//  Copyright © 2020 Adiran Martinez. All rights reserved.


import ARCL
import CoreLocation

class ViewController: UIViewController {
  var sceneLocationView = SceneLocationView()

    override func viewDidLoad() {
      super.viewDidLoad()

      sceneLocationView.run()
      view.addSubview(sceneLocationView)
        
        self.sceneLocationView.locationNodeTouchDelegate = self as! LNTouchDelegate
    }

    override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()

      sceneLocationView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let coordinate = CLLocationCoordinate2D(latitude: 42.343109, longitude: -71.104862)
        let location = CLLocation(coordinate: coordinate, altitude: 13)
        let image = UIImage(named: "Bu_logo")!

        let annotationNode = LocationAnnotationNode(location: location, image: image)
        annotationNode.scaleRelativeToDistance = true
        
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode)
    }
    
    func annotationNodeTouched(node: AnnotationNode) {
        // Do stuffs with the node instance

        // node could have either node.view or node.image
        if let nodeView = node.view{
            // Do stuffs with the nodeView
            // ...
        }
        if let nodeImage = node.image{
            
        }
    }
}


