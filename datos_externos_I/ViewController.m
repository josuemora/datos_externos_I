//
//  ViewController.m
//  datos_externos_I
//
//  Created by Joshua on 13/08/14.
//  Copyright (c) 2014 Joshua. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    
    NSMutableArray * aLista;
}




@end

@implementation ViewController
@synthesize txt_url,txt_datos,tablita;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self btn_limpiar:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_limpiar:(id)sender {
    
    txt_url.text = @"";
    txt_datos.text = @"";
    aLista = [[NSMutableArray alloc] init];
    [tablita reloadData];
   
    
    
}

- (IBAction)btn_traer:(id)sender {

    NSURL * tmpURL = [NSURL URLWithString:txt_url.text];
    NSData * datosexternos = [NSData dataWithContentsOfURL:tmpURL];
    txt_datos.text = [[NSString alloc] initWithData:datosexternos encoding:NSUTF8StringEncoding];
    
    if ([txt_url.text rangeOfString:@"JSON"].location != NSNotFound){
        aLista = [NSJSONSerialization JSONObjectWithData:datosexternos options:0 error:nil];
    }
    
    if ([txt_url.text rangeOfString:@"PLIST"].location != NSNotFound){
        NSMutableDictionary * tmpDict = [[NSMutableDictionary alloc] initWithContentsOfURL:tmpURL];
        
        aLista = [[NSMutableArray alloc] init];
        for(NSString * key in tmpDict){
            NSString * tmpS = [[NSString alloc] initWithFormat:@"Key: %@ Value: %@", key,[tmpDict objectForKey:key]];
            [aLista addObject:tmpS];
        }
        
    }
    
    [tablita reloadData];



}






-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [aLista count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * MyCellId = @"MyCellId";
    
    UITableViewCell * cell = [self.tablita dequeueReusableCellWithIdentifier:MyCellId];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyCellId];
    }
    
    [cell.textLabel setText:[aLista objectAtIndex:[indexPath row]]];
    
    
    return cell;
}

-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}



@end
