//
//  GoogleMapViewController.h
//  LocationsAndMaps
//
//  Created by Zairah Ylagan on 11/10/19.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#include "Delegates.h"

@interface GoogleMapViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet GMSMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) id <TabViewControllerDelegate> delegate;

@end


