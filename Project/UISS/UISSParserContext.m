//
//  UISSParserContext.m
//  UISS
//
//  Created by Robert Wijas on 7/6/12.
//  Copyright (c) 2012 57things. All rights reserved.
//

#import "UISSParserContext.h"
#import "UISSError.h"

@implementation UISSParserContext

@synthesize appearanceStack;
@synthesize groupsStack;
@synthesize errors;
@synthesize propertySetters;

- (id)init
{
    self = [super init];
    if (self) {
        self.appearanceStack = [NSMutableArray array];
        self.groupsStack = [NSMutableArray array];
        self.errors = [NSMutableArray array];
        self.propertySetters = [NSMutableArray array];
    }
    return self;
}

- (void)addErrorWithCode:(NSInteger)code object:(id)object key:(NSString *)key;
{
    NSDictionary *userInfo = nil;
    if (key) {
        userInfo = [NSDictionary dictionaryWithObject:object forKey:key];
    }
    
    [self.errors addObject:[UISSError errorWithCode:code
                                           userInfo:userInfo]];
}

@end
