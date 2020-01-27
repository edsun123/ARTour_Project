//
//  ViewController.swift
//  Model Showing
//
//  Created by Adiran Martinez on 1/26/20.
//  Copyright © 2020 Adiran Martinez. All rights reserved.
//
import ARKit
import UIKit
import MapKit

class ViewController: UIViewController , CLLocationManagerDelegate{

    @IBOutlet weak var sceneView: ARSCNView!
    
    var locationManager = CLLocationManager()
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }*/
        
        addBox()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    func addBox() {
        let scene = SCNScene()
        
        let arrowScene = SCNScene(named: "arrow.dae")
        guard let arrowNode = arrowScene?.rootNode.childNode(withName: "arrow", recursively: true) else {fatalError("arrow not found")}
        
        arrowNode.position = SCNVector3(0, -0.5, -2.0)
        
        scene.rootNode.addChildNode(arrowNode)
        
        /*guard let arrowScene = SCNScene(named: "arrow.scn"), let arrowNode = arrowScene.rootNode.childNode(withName: "arrow", recursively: true) else { return }
        arrowNode.position = SCNVector3(0, 0, 0)
        sceneView.scene.rootNode.addChildNode(arrowNode)*/
        
        
        sceneView.scene = scene
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        let userLocation = locations.last
        let viewRegion = MKCoordinateRegion(center: (userLocation?.coordinate)!, latitudinalMeters: 600, longitudinalMeters: 600)
        self.map.setRegion(viewRegion, animated: true)
    }

}

