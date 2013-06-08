//
//  Person.h
//  RasiseMan
//
//  Created by iacmaysw on 13-6-6.
//  Copyright (c) 2013年 iacmaysw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    NSString *personName;
    float expectedRaise;
}
@property (readwrite,copy)NSString *personName;
@property (readwrite)float expectedRaise;
@end
