//
//  ZLSessionViewController.h
//  Wight
//
//  Created by Steve Wight on 8/22/12.
//  Copyright (c) 2012 Ziato Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLSession.h"

@interface ZLSessionViewController : UITableViewController

@property (nonatomic, retain) ZLSession *trackingSession;
@property (nonatomic, retain) IBOutlet UILabel *sessionDateLabel;
@property (nonatomic, retain) IBOutlet UILabel *totalEventsLabel;

-(IBAction)doneButtonPressed:(id)sender;

@end
