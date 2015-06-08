//
//  ContactViewController.m
//  ContactViewer
//
//  Created by Elliot Schrock on 6/7/15.
//  Copyright (c) 2015 Elliot Schrock. All rights reserved.
//

#import "ContactViewController.h"
#import "Contact.h"

@interface ContactViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;

@end

@implementation ContactViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.nameTextField.text = self.contact.name;
    self.phoneNumberTextField.text = self.contact.phoneNumber;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(screenTapped)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Save"
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(save)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
}

- (void)save
{
    self.contact.name = self.nameTextField.text;
    self.contact.phoneNumber = self.phoneNumberTextField.text;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)screenTapped
{
    [self.view endEditing:YES];
}

@end
