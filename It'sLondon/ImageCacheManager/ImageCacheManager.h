//
//  ImageCacheManager.h
//  It'sLondon
//
//  Created by akshay bansal on 10/25/17.
//  Copyright © 2017 akshay bansal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageCacheManager : NSObject
+ (ImageCacheManager*)sharedInstance;
- (void)cacheImage:(UIImage*)image forKey:(NSString*)key;
- (UIImage*)getCachedImageForKey:(NSString*)key;
@end
