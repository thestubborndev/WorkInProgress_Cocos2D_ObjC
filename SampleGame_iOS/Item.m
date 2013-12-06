//
//  Item.m
//  SampleGame
//
//  Created by Carlotta Tatti on 02/12/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "Item.h"

@implementation Item

- (id)initWithName:(NSString *)name pickable:(BOOL)pickable {
    self = [super init];
    if (self) {
        self.name = name;
        self.pickable = NO;
    }
    return self;
}

@end