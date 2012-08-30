//
//  ZLSessionsListViewController.h
//  Wight
//
//  Created by Steve Wight on 8/26/12.
//  Copyright (c) 2012 Ziato Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLSessionDataController.h"
#import "ZLSession.h"
#import "ZLSessionViewController.h"

@interface ZLSessionsListViewController : UITableViewController

@property (nonatomic, retain) ZLSessionDataController *dataController;

@end
