//
//  MenuLayer.m
//  SampleGame
//
//  Created by Carlotta Tatti on 02/12/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "HUDLayer.h"

@implementation HUDLayer {
    CGSize winSize;
}

// on "init" you need to initialize your instance
- (id)init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
    self = [super init];
	if (self) {
		winSize = [[CCDirector sharedDirector] winSize];
        
        self.touchEnabled = YES;
        
        CCMenuItemImage *slot1 = [[CCMenuItemImage alloc] initWithNormalImage:@"slot.png" selectedImage:@"slot.png" disabledImage:@"slot.png" target:self selector:@selector(clickedSlot)];
        slot1.position = ccp(50, winSize.height-50);
        [self addChild:slot1];
        
        CCMenuItemImage *slot2 = [[CCMenuItemImage alloc] initWithNormalImage:@"slot.png" selectedImage:@"slot.png" disabledImage:@"slot.png" target:self selector:@selector(clickedSlot)];
        slot2.position = ccp(120, winSize.height-50);
        [self addChild:slot2];
        
        CCMenuItemImage *slot3 = [[CCMenuItemImage alloc] initWithNormalImage:@"slot.png" selectedImage:@"slot.png" disabledImage:@"slot.png" target:self selector:@selector(clickedSlot)];
        slot3.position = ccp(190, winSize.height-50);
        [self addChild:slot3];
        
        CCMenuItemImage *slot4 = [[CCMenuItemImage alloc] initWithNormalImage:@"slot.png" selectedImage:@"slot.png" disabledImage:@"slot.png" target:self selector:@selector(clickedSlot)];
        slot4.position = ccp(260, winSize.height-50);
        [self addChild:slot4];
    }
	return self;
}

- (void)clickedSlot {
    NSLog(@"Clicked slot");
}

@end
