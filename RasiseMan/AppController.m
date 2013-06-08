//
//  AppController.m
//  RasiseMan
//
//  Created by iacmaysw on 13-6-7.
//  Copyright (c) 2013年 iacmaysw. All rights reserved.
//

#import "AppController.h"
#import "PreferenceController.h"
@implementation AppController
-(IBAction)showPreferencePanel:(id)sender
{
    if (!preferenceController) {
        preferenceController=[[PreferenceController alloc]init];        
    }
    NSLog(@"showing %@",preferenceController);
    [preferenceController showWindow:self];
    
}

@end
