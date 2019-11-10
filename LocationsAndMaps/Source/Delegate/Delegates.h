//
//  Delegates.h
//  LocationsAndMaps
//
//  Created by Zairah Ylagan on 11/10/19.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

// Mark - Delegate
@protocol TabViewControllerDelegate

@required
- (void)didChangeLocation:(CLLocation *)location;

@end
