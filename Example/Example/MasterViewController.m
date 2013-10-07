//
//  MasterViewController.m
//  Example
//
//  Created by Heiko Dreyer on 30.09.13.
//  Copyright (c) 2013 boxedfolder.com. All rights reserved.
//

#import "MasterViewController.h"
#import "AppDelegate.h"
#import "CocoaMite.h"

#import "DetailViewController.h"

@interface MasterViewController ()
{
    NSArray *_objects;
    CocoaMite *_client;
}
@end

@implementation MasterViewController

-(void)awakeFromNib
{
    [super awakeFromNib];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    _client = ((AppDelegate *)[UIApplication sharedApplication].delegate).client;
    _objects = [NSArray array];
    
    [_client projectsWithParameters: nil archived: NO callback: ^(NSError *error, id result) {
        if(!error)
        {
            _objects = (NSArray *)result;
            [self.tableView reloadData];
        }
    }];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table View

-(NSInteger)numberOfSectionsInTableView: (UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection: (NSInteger)section
{
    return _objects.count;
}

-(UITableViewCell *)tableView: (UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDictionary *object = _objects[indexPath.row];
    cell.textLabel.text = object[@"project"][@"name"];
    
    return cell;
}

-(BOOL)tableView: (UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString: @"showDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *object = (NSDictionary *)[_objects objectAtIndex: indexPath.row];
        NSUInteger detailId = [object[@"project"][@"id"] integerValue];
        [[segue destinationViewController] setDetailId: detailId];
        
    }
}

@end
