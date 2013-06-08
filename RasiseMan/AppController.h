//
//  AppController.h
//  RasiseMan
//
//  Created by iacmaysw on 13-6-7.
//  Copyright (c) 2013年 iacmaysw. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PreferenceController;
@interface AppController : NSObject
{
    PreferenceController *preferenceController;
}
-(IBAction)showPreferencePanel:(id)sender;
@end
