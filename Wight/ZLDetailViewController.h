//
//  ZLDetailViewController.h
//  Wight
//
//  Created by Steve Wight on 8/20/12.
//  Copyright (c) 2012 Ziato Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
