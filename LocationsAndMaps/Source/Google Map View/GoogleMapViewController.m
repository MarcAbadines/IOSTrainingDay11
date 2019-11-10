//
//  GoogleMapViewController.m
//  LocationsAndMaps
//
//  Created by Zairah Ylagan on 11/10/19.
//

#import "GoogleMapViewController.h"

const float zoom = 15.0f;

@implementation GoogleMapViewController

// Mark - Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupMap];
    [self startLocationService];
}

// Mark - Functions
-(void)showTitle:(NSString *) title withMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {}];
    
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)setupMap {
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86 longitude:151.20 zoom:zoom];
    _mapView.camera = camera;
    _mapView.myLocationEnabled = YES;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    CLLocationCoordinate2D location;
    location.latitude = -33.86;
    location.longitude = 151.20;
    marker.position = location;
    marker.title = @"Title";
    marker.snippet = @"Snippet";
    marker.map = _mapView;
    
}

- (void)startLocationService {
    if (_locationManager == nil) {
        _locationManager = [[CLLocationManager alloc]init]; // initializing locationManager
        _locationManager.delegate = self; // we set the delegate of locationManager to self.
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest; // setting the accuracy
        [_locationManager requestLocation];
        [_locationManager startUpdatingLocation];  //requesting location updates
        
    }
}

- (void)centerToLocation:(CLLocation *) location {
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:location.coordinate.latitude longitude:location.coordinate.longitude zoom:zoom];
    _mapView.camera = camera;
}

// Mark - LocationManager Delegate
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSString * msg = [NSString stringWithFormat:@"There was an error retrieving your location/%@", error.localizedDescription];
    [self showTitle:@"Error" withMessage:msg];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *crnLoc = [locations lastObject];
    [self centerToLocation:crnLoc];
    [_delegate didChangeLocation:crnLoc];
}

@end

