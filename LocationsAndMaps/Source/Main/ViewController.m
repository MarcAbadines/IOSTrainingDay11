//
//  ViewController.m
//  LocationsAndMaps
//
//  Created by Zairah Ylagan on 11/10/19.
//

#import "ViewController.h"

NSString *const tabControllerSegue = @"tabControllerSegue";

@interface ViewController ()

@end

@implementation ViewController

// Mark - Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    
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

- (void)displayLocationDetails:(CLLocation *) location {
    _latitude.text = [NSString stringWithFormat:@"%.8f",location.coordinate.latitude];
    _longitude.text = [NSString stringWithFormat:@"%.8f",location.coordinate.longitude];
    _altitude.text = [NSString stringWithFormat:@"%.0f m",location.altitude];
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
    [self showTitle:@"Error" withMessage:@"There was an error retrieving your location"];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *crnLoc = [locations lastObject];
    [self displayLocationDetails:crnLoc];
}


@end
