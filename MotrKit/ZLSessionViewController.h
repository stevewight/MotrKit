//
//  ZLSessionViewController.h
//  Wight
//
//  Created by Steve Wight on 8/22/12.
//  Copyright (c) 2012 Ziato Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLSession.h"
#import "ZLEventAnnotation.h"
#import "ZLEventLocation.h"
#import "ZLSessionViewController.h"

@protocol ZLSessionViewControllerDelegate <NSObject>

-(void)zlSessionViewControllerIsDone;

@end

@interface ZLSessionViewController : UITableViewController

@property (nonatomic, retain) ZLSession *trackingSession;
@property (nonatomic, retain) IBOutlet UILabel *sessionDateLabel;
@property (nonatomic, retain) IBOutlet UILabel *totalEventsLabel;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) id <ZLSessionViewControllerDelegate> delegate;

-(IBAction)doneButtonPressed:(id)sender;
-(void)setSessionLocationsOnMap;

@end
