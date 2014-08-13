//
//  ViewController.h
//  datos_externos_I
//
//  Created by Joshua on 13/08/14.
//  Copyright (c) 2014 Joshua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tablita;
@property (strong, nonatomic) IBOutlet UITextField *txt_url;
@property (strong, nonatomic) IBOutlet UITextView *txt_datos;
- (IBAction)btn_limpiar:(id)sender;

- (IBAction)btn_traer:(id)sender;


@end
