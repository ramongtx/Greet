//
//  AddInfoViewController.m
//  Greet
//
//  Created by Rafael Padilha on 16/10/13.
//  Copyright (c) 2013 Rock Bottom. All rights reserved.
//

#import "AddInfoViewController.h"

@interface AddInfoViewController ()

@end

@implementation AddInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    
    // add gesture recognizer in order to dismiss keyboar when tap outside fields
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    
    
    NSUserDefaults* prefs = [NSUserDefaults standardUserDefaults];
    NSMutableArray* data = [prefs objectForKey:@"data"];
    if(data != nil){
        self.nameTextField.text = [data objectAtIndex:0];
        self.emailTextField.text = [data objectAtIndex:1];
        self.fbTextField.text = [data objectAtIndex:2];
        self.phoneTextField.text = [data objectAtIndex:3];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveData:(id)sender {
    NSUserDefaults* prefs = [NSUserDefaults standardUserDefaults];
    NSMutableArray* data = [[NSMutableArray alloc]initWithCapacity:4];
    
    [data addObject:self.nameTextField.text];
    [data addObject:self.emailTextField.text];
    [data addObject:self.fbTextField.text];
    [data addObject:self.phoneTextField.text];
    
    
    [prefs setObject:data forKey:@"data"];
    
    [prefs synchronize];
}

- (IBAction)clearData:(id)sender {
    
    NSUserDefaults* prefs = [NSUserDefaults standardUserDefaults];
    
    [prefs setObject:nil forKey:@"data"];
    
    self.nameTextField.text = @"";
    self.fbTextField.text = @"";
    self.emailTextField.text = @"";
    self.phoneTextField.text = @"";
    
    [prefs synchronize];
}

- (IBAction)backToGreet:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)dismissKeyboard
{
    [self.nameTextField resignFirstResponder];
    [self.fbTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
    [self.phoneTextField resignFirstResponder];
}
@end
