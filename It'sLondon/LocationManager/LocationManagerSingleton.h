//
//  LocationManagerSingleton.h
//  It'sLondon
//
//  Created by akshay bansal on 10/24/17.
//  Copyright © 2017 akshay bansal. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <MapKit/MapKit.h>

@interface LocationManagerSingleton : NSObject<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager* locationManager;

+ (LocationManagerSingleton*)sharedSingleton;

@end
