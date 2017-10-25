//
//  LocationManagerSingleton.m
//  It'sLondon
//
//  Created by akshay bansal on 10/24/17.
//  Copyright © 2017 akshay bansal. All rights reserved.
//

#import "LocationManagerSingleton.h"


@interface LocationManagerSingleton()
{

}
@end

@implementation LocationManagerSingleton

- (id)init {
    self = [super init];
    if(self) {
        self.locationManager = [CLLocationManager new];
        [self.locationManager setDelegate:self];
        [self.locationManager setDistanceFilter:kCLDistanceFilterNone];
        [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        [self.locationManager setHeadingFilter:kCLHeadingFilterNone];
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0)
        {
            if ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusAuthorizedWhenInUse) {
                [self.locationManager requestAlwaysAuthorization];
            }
            else
            {
                [self.locationManager requestWhenInUseAuthorization];
            }
        }
        else if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
            [self.locationManager requestAlwaysAuthorization];//auth for location using

        
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9) {
          //  self.locationManager.allowsBackgroundLocationUpdates=YES;
        }
        
        [self.locationManager startMonitoringSignificantLocationChanges];
        [self.locationManager startUpdatingLocation];
        
        //do any more customization to your location manager
    

        
        
    }
    
    return self;
}

+ (LocationManagerSingleton*)sharedSingleton {
    static LocationManagerSingleton* sharedSingleton;
    if(!sharedSingleton) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sharedSingleton = [LocationManagerSingleton new];
        });
    }
                      
   return sharedSingleton;
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {

    
    

}



- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    //handle your heading updates here- I would suggest only handling the nth update, because they
    //come in fast and furious and it takes a lot of processing power to handle all of them
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{

}


                    
                      
@end
