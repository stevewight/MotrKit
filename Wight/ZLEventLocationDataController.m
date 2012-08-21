//
//  ZLEventLocationDataController.m
//  Wight
//
//  Created by Steve Wight on 8/21/12.
//  Copyright (c) 2012 Ziato Labs. All rights reserved.
//

#import "ZLEventLocationDataController.h"

@implementation ZLEventLocationDataController

@synthesize masterEvenList;

-(id)init {
    
    self.masterEvenList = [[NSMutableArray alloc] init];
    
    return self;
}

-(ZLEventLocation *)getObjectFromMasterListAtIndex:(NSUInteger)index {
    return [self.masterEvenList objectAtIndex:index];
}

-(void)addEventToMasterList:(ZLEventLocation *)event {
    [self.masterEvenList addObject:event];
}

-(NSUInteger)countOfMasterEvenList {
    return [self.masterEvenList count];
}

@end
