//
//  Person.m
//  RasiseMan
//
//  Created by iacmaysw on 13-6-6.
//  Copyright (c) 2013年 iacmaysw. All rights reserved.
//

#import "Person.h"
@implementation Person
@synthesize personName;
@synthesize expectedRaise;
-(id)init
{
    self=[super init];
    if (self) {
        expectedRaise=0.05;
        personName=@"New Person";
    }
    NSLog(@"init person");
    return self;
}
-(void)setNilValueForKey:(NSString *)key
{
    if ([key isEqualToString:@"expectedRaise"]) {
        [self setExpectedRaise:0.0];
    }
    else
        [super setNilValueForKey:key];
}
-(void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:personName forKey:@"personName"];
    [coder encodeFloat:expectedRaise forKey:@"expectedRaise"];
}
-(id)initWithCoder:(NSCoder *)coder
{
    self=[super init];
    if(self)
{
    personName=[coder decodeObjectForKey:@"personName"];
    expectedRaise=[coder decodeFloatForKey:@"expectedRaise"];
}
return self;
}
@end
