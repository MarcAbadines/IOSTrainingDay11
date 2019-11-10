//
//  ViewController.h
//  LocationsAndMaps
//
//  Created by Zairah Ylagan on 11/10/19.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "Delegates.h"

@interface ViewController : UIViewController <TabViewControllerDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *latitude;
@property (weak, nonatomic) IBOutlet UILabel *longitude;
@property (weak, nonatomic) IBOutlet UILabel *altitude;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end
