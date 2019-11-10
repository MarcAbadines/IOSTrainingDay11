//
//  ViewController.m
//  LocationsAndMaps
//
//  Created by Zairah Ylagan on 11/10/19.
//

#import "ViewController.h"
#include "GoogleMapViewController.h"
#include "MapViewController.h"

NSString *const tabControllerSegue = @"tabControllerSegue";

@interface ViewController ()

@end

@implementation ViewController

// Mark - Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startLocationService];
    [self checkLocationAccess];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:tabControllerSegue]) {
        UITabBarController *tab = [segue destinationViewController];
        GoogleMapViewController *gmv = tab.viewControllers[1];
        gmv.delegate = self;
        
        MapViewController *mv = tab.viewControllers[0];
        mv.delegate = self;
        
    }
}

// Mark - Functions
-(void)showTitle:(NSString *) title withMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)displayLocationDetails:(CLLocation *) location {
    _latitude.text = [NSString stringWithFormat:@"%.8f",location.coordinate.latitude];
    _longitude.text = [NSString stringWithFormat:@"%.8f",location.coordinate.longitude];
    _altitude.text = [NSString stringWithFormat:@"%.0f m",location.altitude];
}


- (void)checkLocationAccess {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    switch (status) {
        case kCLAuthorizationStatusDenied:
            break;
        case kCLAuthorizationStatusRestricted:
            break;
        case kCLAuthorizationStatusNotDetermined:
            [_locationManager requestWhenInUseAuthorization];
        case kCLAuthorizationStatusAuthorizedAlways:
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            break;
    }
}

- (void)startLocationService {
    if (_locationManager == nil) {
        _locationManager = [[CLLocationManager alloc]init]; // initializing locationManager
        _locationManager.delegate = self; // we set the delegate of locationManager to self.
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest; // setting the accuracy
        [_locationManager startUpdatingLocation];  //requesting location updates
    }
}

// Mark - LocationManager Delegate
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSString * msg = [NSString stringWithFormat:@"There was an error retrieving your location/%@", error.localizedDescription];
    [self showTitle:@"Error" withMessage:msg];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *crnLoc = [locations lastObject];
    [self displayLocationDetails:crnLoc];
}

// Mark - TabViewControllerDelegate
- (void)didChangeLocation:(CLLocation *)location {
    [self displayLocationDetails:location];
}
@end
