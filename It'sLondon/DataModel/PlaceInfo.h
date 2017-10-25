//
//  PageInfo.h
//  Sumona
//
//  Created by akshay bansal on 8/6/17.
//  Copyright © 2017 akshay bansal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface PlaceInfo : NSObject

@property (nonatomic,copy) NSString* place;
@property (nonatomic,copy) NSString* imagename;
@property (nonatomic,copy) NSString* address;
@property (nonatomic,copy) NSString* info;
@property (nonatomic,assign) CLLocationCoordinate2D coordinate;

-(id)initWithPlace:(NSString *)place imageName:(NSString *)imagename address:(NSString *)address info:(NSString*)info coordinates:(CLLocationCoordinate2D)coordinate;

@end
