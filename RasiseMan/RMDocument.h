//
//  RMDocument.h
//  RasiseMan
//
//  Created by iacmaysw on 13-6-6.
//  Copyright (c) 2013年 iacmaysw. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@interface RMDocument : NSDocument
{
    NSMutableArray *employees;
}
@property (weak) IBOutlet NSTableView *tableView;
@property (weak)IBOutlet NSArrayController *employeesController;
-(void)setEmployees:(NSMutableArray *)a;
-(IBAction)removeEmployee:(id)sender;
@end
