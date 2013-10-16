//
//  ViewController.m
//  Greet
//
//  Created by Ramon Carvalho Maciel on 10/16/13.
//  Copyright (c) 2013 Rock Bottom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.border1.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.border1.layer setBorderWidth: 1.0];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gotoAddInfoView:(id)sender {
    [self performSegueWithIdentifier:@"addInfoSegue" sender:nil];
}
@end
