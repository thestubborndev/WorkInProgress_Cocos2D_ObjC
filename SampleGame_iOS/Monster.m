//
//  Monster.m
//  SampleGame
//
//  Created by Carlotta Tatti on 02/12/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "Monster.h"

@implementation Monster

- (id)init {
    self = [super initWithFile:@"cell.png"];
    if (self) {
        self.color = ccRED;
        self.scale = 0.25;
        self.anchorPoint = ccp(0, 0);
        }
    return self;
}

@end
