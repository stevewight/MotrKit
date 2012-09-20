//
//  ZLSessionViewController.m
//  Wight
//
//  Created by Steve Wight on 8/22/12.
//  Copyright (c) 2012 Ziato Labs. All rights reserved.
//

#import "ZLSessionViewController.h"

@interface ZLSessionViewController ()

@end

@implementation ZLSessionViewController

@synthesize trackingSession;
@synthesize sessionDateLabel;
@synthesize totalEventsLabel;
@synthesize mapView;
@synthesize delegate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)doneButtonPressed:(id)sender {
    NSLog(@"done button has been pressed");
    
    NSLog(@"This is the navigationController: %@",[self.navigationController viewControllers]);
    
    [self.delegate zlSessionViewControllerIsDone];
    NSArray *viewControllers = [self.navigationController viewControllers];
    [self.navigationController popToViewController:[viewControllers objectAtIndex:1] animated:YES];
}

-(void)setSessionLocationsOnMap {
    
    NSLog(@"setSessionLocationOnMap has been fired");
    
    ZLEventLocation *startEvent = [trackingSession.dataController getObjectFromMasterListAtIndex:0];
    
    //zoom in based on the furthest left and furthese right location coordinates
    MKCoordinateSpan span;
    MKCoordinateRegion region;
    
    span.latitudeDelta = 0.03;
    span.longitudeDelta = 0.012;

    region.center = startEvent.loc.coordinate;
    region.span = span;
    
    [self.mapView setRegion:region animated:YES];
    
    for (int i=0;i < [self.trackingSession.dataController countOfMasterEvenList];i++) {
        
        ZLEventLocation *eventLoc = [self.trackingSession.dataController getObjectFromMasterListAtIndex:i];
        
        ZLEventAnnotation *annotation = [[ZLEventAnnotation alloc] initWithLocation:eventLoc.loc.coordinate];
        
//        if (i==0) {
//            annotation.pinColor = MKPinAnnotationColorRed;
//        } else if ([eventLoc.type isEqualToString:@"[BF]"]) {
//            annotation.pinColor = MKPinAnnotationColorGreen;
//        } else if ([eventLoc.type isEqualToString:@"[LM]"]) {
//            annotation.pinColor = MKPinAnnotationColorPurple;
//        }
        
        
        [self.mapView addAnnotation:annotation];
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"this is session when ZLSessionViewController is loaded %@",self.trackingSession);
    
    self.sessionDateLabel.text = [NSString stringWithFormat:@"%@",self.trackingSession.date];
    self.totalEventsLabel.text = [NSString stringWithFormat:@"%d",[self.trackingSession.dataController countOfMasterEvenList]];
    
    [self setSessionLocationsOnMap];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.hidesBackButton = YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.mapView = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    
//    // Configure the cell...
//    
//    return cell;
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
