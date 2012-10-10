//
//  ZLSessionDataController.h
//  Wight
//
//  Created by Steve Wight on 8/27/12.
//  Copyright (c) 2012 Ziato Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLAppDelegate.h"
#import "ZLSession.h"

@interface ZLSessionDataController : NSObject

@property (nonatomic, retain) NSMutableArray *sessionsMasterList;

-(void)pullSessions;
-(ZLSession *)sessionInMasterListAtIndex:(NSUInteger)theIndex;
-(NSUInteger)countOfSessionsMasterList;

@end
