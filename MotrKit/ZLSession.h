//
//  ZLSession.h
//  Wight
//
//  Created by Steve Wight on 8/22/12.
//  Copyright (c) 2012 Ziato Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLEventLocationDataController.h"

@interface ZLSession : NSObject

@property (nonatomic, retain) NSDate *date;
@property (nonatomic, retain) ZLEventLocationDataController *dataController;

-(void)createEventLocationsFromSet:(NSSet *)eventLocation;

@end
