//
//  DetailViewController.m
//  Example
//
//  Created by Heiko Dreyer on 30.09.13.
//  Copyright (c) 2013 boxedfolder.com. All rights reserved.
//

#import "CocoaMite.h"
#import "DetailViewController.h"
#import "AppDelegate.h"

@interface DetailViewController ()

- (void)configureView;

@end

@implementation DetailViewController
{
    CocoaMite *_client;
}

#pragma mark - Managing the detail item


-(void)configureView
{
    _client = ((AppDelegate *)[UIApplication sharedApplication].delegate).client;
    
    [_client projectsWithParameters: @{@"id": [NSNumber numberWithInt: _detailId]} archived: NO callback: ^(NSError *error, id result) {
        if(!error)
        {
            result = result[@"project"];
            _detailDescriptionLabel.text = [NSString stringWithFormat: @"Name: %@ - Created At: %@ - Id: %@", result[@"name"], result[@"created_at"], result[@"id"]];
        }
    }];

}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
