//
//  ZLEventLocation.h
//  Wight
//
//  Created by Steve Wight on 8/21/12.
//  Copyright (c) 2012 Ziato Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface ZLEventLocation : NSObject

@property (nonatomic,retain) NSString *type;
@property (nonatomic,retain) NSString *desc;
@property (nonatomic,retain) CLLocation *loc;

@end
