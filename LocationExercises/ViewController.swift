import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate
{
    @IBOutlet weak var map: MKMapView!
    var curLoc : CLLocation!
    
    var locManager: CLLocationManager!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        locManager = CLLocationManager()
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.distanceFilter = 10 //in meters
        locManager.delegate = self
        locManager.startUpdatingLocation()
        locManager.requestAlwaysAuthorization()
        
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation])
    {
        guard let loc = locations.last else {return}
        
        let locationAge = -loc.timestamp.timeIntervalSinceNow
        print(loc.timestamp.timeIntervalSinceNow)
        
        if locationAge > 30.0
        {
            print("location update isnt happenning ")
            return
        }
        
        if self.curLoc == nil || self.curLoc.horizontalAccuracy >= loc.horizontalAccuracy
        {
            self.curLoc = loc
            let zoomLocation = CLLocationCoordinate2D.init(latitude: curLoc.coordinate.latitude,
                                                           longitude: curLoc.coordinate.longitude)
            let newRegion = MKCoordinateRegion(center: zoomLocation,
                                               latitudinalMeters: 300,
                                               longitudinalMeters: 300)
            map.setRegion(newRegion, animated: true)
        }
        
        if loc.horizontalAccuracy <= self.locManager.desiredAccuracy
        {
            if CLLocationManager.locationServicesEnabled()
            {
                self.locManager.stopUpdatingLocation()
            }
        }
        
    }


}

