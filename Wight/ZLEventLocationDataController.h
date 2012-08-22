//
//  ZLEventLocationDataController.h
//  Wight
//
//  Created by Steve Wight on 8/21/12.
//  Copyright (c) 2012 Ziato Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLEventLocation.h"
#import "ZLAppDelegate.h"

@interface ZLEventLocationDataController : NSObject

@property (nonatomic,retain) NSMutableArray *masterEvenList;

-(ZLEventLocation *)getObjectFromMasterListAtIndex:(NSUInteger)index;
-(void)addEventToMasterList:(ZLEventLocation *)event;
-(NSUInteger)countOfMasterEvenList;
-(NSDate *)saveSession;
-(void)pullSessions;

@end
