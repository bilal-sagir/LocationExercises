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
        let myCenter = CLLocationCoordinate2D(latitude: 40.978189, longitude: 29.041718)
        
        let myRegion = MKCoordinateRegion.init(center: myCenter, latitudinalMeters: 300, longitudinalMeters: 300)
        myMap.setRegion(myRegion, animated: true)
        
        let tommysCoor = CLLocationCoordinate2D(latitude: 40.978189, longitude: 29.042718)
        
        let tommys = Restaurants(name: "Tommys", coord: tommysCoor, title: "Tommys", subtitle: "lol")
        
        myMap.addAnnotation(tommys)
        
    }
    
    
    class Restaurants : NSObject, MKAnnotation
    {
        var coordinate: CLLocationCoordinate2D
        
        var title: String?
        var subtitle: String?
        
        var name: String
        
        init(name: String, coord: CLLocationCoordinate2D,
             title:String?, subtitle: String? )
        {
            self.name = name
            self.coordinate = coord
            self.title = title
            self.subtitle = subtitle
        }
    }

}

