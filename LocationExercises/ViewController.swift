import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate
{
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
        print(locations.last)
    }


}

