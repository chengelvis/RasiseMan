//
//  PreferenceController.h
//  RasiseMan
//
//  Created by iacmaysw on 13-6-7.
//  Copyright (c) 2013年 iacmaysw. All rights reserved.
//

#import <Cocoa/Cocoa.h>
//extern NSString *const BNRColorChangedNotification;
@interface PreferenceController : NSWindowController
{
    IBOutlet NSColorWell *colorWell;
    IBOutlet NSButton *checkBox;
    
}

-(IBAction)changeBackgroundColor:(id)sender;
-(IBAction)changeNewEmptyDoc:(id)sender;
@end
