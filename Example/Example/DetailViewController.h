//
//  DetailViewController.h
//  Example
//
//  Created by Heiko Dreyer on 30.09.13.
//  Copyright (c) 2013 boxedfolder.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (assign, nonatomic) NSInteger detailId;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
