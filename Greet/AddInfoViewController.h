//
//  AddInfoViewController.h
//  Greet
//
//  Created by Rafael Padilha on 16/10/13.
//  Copyright (c) 2013 Rock Bottom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddInfoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *fbTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;




@property (strong,nonatomic) NSString* name;

- (IBAction)saveData:(id)sender;
- (IBAction)clearData:(id)sender;
- (IBAction)backToGreet:(id)sender;

@end
