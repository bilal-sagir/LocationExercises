import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate
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
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = myCenter
        annotation.title = "HOME"
        myMap.addAnnotation(annotation)
        myMap.delegate = self
    }
    
    func mapView(_ mapView: MKMapView,
                 viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "annotId")
        
        annotationView.canShowCallout = true
        
        annotationView.rightCalloutAccessoryView = UIButton.init(type: UIButton.ButtonType.detailDisclosure)
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView,
                 annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl)
    {
        guard let annotation = view.annotation else {return}
        
        let urlString = "http://maps.apple.com/?ll=\(annotation.coordinate.latitude),\(annotation.coordinate.longitude)"
        
        guard let url = URL(string: urlString) else {return}
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
        
    }


}

