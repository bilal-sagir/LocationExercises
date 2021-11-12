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
    
}

