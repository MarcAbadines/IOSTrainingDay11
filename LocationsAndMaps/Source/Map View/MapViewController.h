//
//  MapViewController.h
//  LocationsAndMaps
//
//  Created by Zairah Ylagan on 11/10/19.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#include "Delegates.h"

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) id <TabViewControllerDelegate> delegate;

@end
