//
//  PreferenceController.m
//  RasiseMan
//
//  Created by iacmaysw on 13-6-7.
//  Copyright (c) 2013年 iacmaysw. All rights reserved.
//

#import "PreferenceController.h"

@interface PreferenceController ()

@end
NSString *const BNRColorChangedNotification=@"BNRColorChanged";
@implementation PreferenceController

-(id)init
{
    self=[super initWithWindowNibName:@"Preference"];
    return self;
}

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    NSLog(@"Nib file is load");
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}
-(IBAction)changeBackgroundColor:(id)sender
{
    NSColor *color=[colorWell color];
    NSLog(@"Color changed:%@",color);
    NSNotificationCenter *nc=[NSNotificationCenter defaultCenter];
    NSLog(@"sending notification");
 [nc postNotificationName:BNRColorChangedNotification object:self];
}
-(IBAction)changeNewEmptyDoc:(id)sender
{
    NSInteger state=[checkBox state];
    NSLog(@"CheckBox changed %ld",state);
}
@end
