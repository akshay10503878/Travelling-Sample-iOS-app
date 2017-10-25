//
//  DesinableButton.m
//  It'sLondon
//
//  Created by akshay bansal on 10/17/17.
//  Copyright © 2017 akshay bansal. All rights reserved.
//

#import "DesinableButton.h"

@implementation DesinableButton


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.borderWidth    = 2;
        self.cornerRadius  = 10;
        self.borderColor = [UIColor blueColor];
        [self customInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self customInit];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    [self customInit];
}

- (void)setNeedsLayout {
    [super setNeedsLayout];
    [self setNeedsDisplay];
}


- (void)prepareForInterfaceBuilder {
    
    [self customInit];
}

- (void)customInit {
    
    
    self.layer.cornerRadius = self.cornerRadius;
    self.layer.borderWidth = self.borderWidth;
    
    if (self.cornerRadius > 0) {
        self.layer.masksToBounds = YES;
    }
    
    [self.layer setBorderColor:[self.borderColor CGColor]];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    self.transform=CGAffineTransformScale(self.transform, 1.2, 1.2);
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:5 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.transform=CGAffineTransformIdentity;
    } completion:nil];
    
    [super touchesBegan:touches withEvent:event];
    
}

@end
