//
//  RMDocument.m
//  RasiseMan
//
//  Created by iacmaysw on 13-6-6.
//  Copyright (c) 2013年 iacmaysw. All rights reserved.
//

#import "RMDocument.h"
extern NSString *const BNRColorChangedNotification;
@implementation RMDocument
@synthesize tableView;
@synthesize employeesController;
- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        employees=[[NSMutableArray alloc]init];
    NSLog(@"init document");
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(handleColorChanged:) name:BNRColorChangedNotification object:nil];
        NSLog(@"Registered with notification center");
    }
    return self;
}
-(void)handleColorChanged:(NSNotificationCenter *)note
{
    NSLog(@"Received notificaton:%@",note);
    
}
-(void)setEmployees:(NSMutableArray *)a
{
    if (a==employees)
        return;
    employees=a;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"RMDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    [[tableView window]endEditingFor:nil];
    return [NSKeyedArchiver archivedDataWithRootObject:employees];
 /*   NSException *exception = [NSException exceptionWithName:@"UnimplementedMethod" reason:[NSString stringWithFormat:@"%@ is unimplemented", NSStringFromSelector(_cmd)] userInfo:nil];
    @throw exception;
    return nil;*/
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    NSLog(@"about to read type %@",typeName);
    NSMutableArray *newArray=nil;
    @try {
        newArray=[NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    @catch (NSException *exception) {
        NSLog(@"exception=%@",exception);
        if (outError) {
            NSDictionary *d=[NSDictionary dictionaryWithObject:@"the data is corrupted" forKey:NSLocalizedFailureReasonErrorKey];
            *outError=[NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:d];
        }
return NO;
    }
    @finally {
        NSLog(@"finally");
    }
[self setEmployees:newArray];
return YES;
   /* NSException *exception = [NSException exceptionWithName:@"UnimplementedMethod" reason:[NSString stringWithFormat:@"%@ is unimplemented", NSStringFromSelector(_cmd)] userInfo:nil];
    @throw exception;
    return YES;*/
}
-(IBAction)removeEmployee:(id)sender
{
    NSArray *selectedPeople=[employeesController selectedObjects];
    NSAlert *alert=[NSAlert alertWithMessageText:@"do you want to remove these people" defaultButton:@"Remove" alternateButton:@"Cancel" otherButton:nil informativeTextWithFormat:@"%ld people will be removed",[selectedPeople count]];
    NSLog(@"starting alert sheet");
    [alert beginSheetModalForWindow:[tableView window] modalDelegate:self didEndSelector:@selector(alertEnded:code:context:) contextInfo:NULL];
}
-(void)alertEnded:(NSAlert *)alert code:(NSInteger)choice context:(void *)v
{
    NSLog(@"Alert sheet Ended");
    if (choice==NSAlertDefaultReturn) {
        //[employeesController remove:nil]; //elvis
        //add some
      /* NSInteger change= NSRunAlertPanel(@"Warning", @"Change?", @"YES", @"NO", nil);
        if (change==NSAlertDefaultReturn)*/
        [[employeesController selectedObjects] setValue:0 forKey:@"expectedRaise"];
        
    }
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
