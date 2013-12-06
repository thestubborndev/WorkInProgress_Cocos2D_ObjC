//
//  GameScene.h
//  SampleGame
//
//  Created by Carlotta Tatti on 02/12/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "CCScene.h"
#import "GameLayer.h"
#import "HUDLayer.h"

@interface GameScene : CCScene {
    GameLayer *gameLayer;
    HUDLayer *hudLayer;
}

@end
