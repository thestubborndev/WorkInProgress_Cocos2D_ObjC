//
//  PathfindingNode.h
//  SampleGame
//
//  Created by Carlotta Tatti on 28/08/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "cocos2d.h"

@interface PathfindingNode : NSObject

@property (nonatomic) int x;
@property (nonatomic) int y;

@property (nonatomic) int f;

@property (nonatomic) int g;
@property (nonatomic) int h;

@property (strong, nonatomic) PathfindingNode *parentNode;

@end
