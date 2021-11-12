import UIKit
import MapKit

class ViewController: UIViewController
{

    @IBOutlet weak var myMap: MKMapView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myMap.mapType = MKMapType.standard
        myMap.isZoomEnabled = true
        myMap.isScrollEnabled = true
        myMap.isRotateEnabled = true
        
    }


    @IBAction func takeMeToLocation(_ sender: Any)
    {
        let myCenter = CLLocationCoordinate2D(latitude: 40.978189, longitude: 29.041718)
        let myRegion = MKCoordinateRegion.init(center: myCenter, latitudinalMeters: 300, longitudinalMeters: 300)
        
        myMap.setRegion(myRegion, animated: true)
        
        
    }

}

