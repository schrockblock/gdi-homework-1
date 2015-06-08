//
//  ContactTableViewController.m
//  ContactViewer
//
//  Created by Elliot Schrock on 6/7/15.
//  Copyright (c) 2015 Elliot Schrock. All rights reserved.
//

#import "ContactTableViewController.h"
#import "ContactViewController.h"
#import "Contact.h"

@interface ContactTableViewController ()
@property (nonatomic, strong) NSArray *contacts;
@end

@implementation ContactTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Contact *dentist = [[Contact alloc] init];
    dentist.name = @"Dentist";
    dentist.phoneNumber = @"617-555-9250";
    
    Contact *favProfessor = [[Contact alloc] init];
    favProfessor.name = @"Favorite Professor";
    favProfessor.phoneNumber = @"520-555-4895";
    
    self.contacts = @[dentist, favProfessor];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = ((Contact *)self.contacts[indexPath.row]).name;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Create the next view controller.
    ContactViewController *detailViewController = [[ContactViewController alloc] initWithNibName:@"ContactViewController" bundle:nil];
    
    // Pass the selected object to the new view controller.
    detailViewController.contact = self.contacts[indexPath.row];
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
