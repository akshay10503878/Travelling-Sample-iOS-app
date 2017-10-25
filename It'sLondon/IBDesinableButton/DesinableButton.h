//
//  DesinableButton.h
//  It'sLondon
//
//  Created by akshay bansal on 10/17/17.
//  Copyright © 2017 akshay bansal. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE

@interface DesinableButton : UIButton


@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable NSInteger borderWidth;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@end
