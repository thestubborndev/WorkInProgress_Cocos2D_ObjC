//
//  GameScene.m
//  SampleGame
//
//  Created by Carlotta Tatti on 02/12/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

- (id)init {
    self = [super init];
    if (self) {
        gameLayer = [GameLayer node];
        [self addChild:gameLayer];
//        hudLayer = [HUDLayer node];
//        [self addChild:hudLayer];
    }
    return self;
}

@end
