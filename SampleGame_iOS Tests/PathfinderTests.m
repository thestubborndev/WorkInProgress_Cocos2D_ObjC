//
//  PathfinderTests.m
//  SampleGame_iOS
//
//  Created by Carlotta Tatti on 05/12/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "Kiwi.h"

#import "Pathfinder.h"
#import "PathfindingNode.h"

SPEC_BEGIN(PathfinderTests)
describe(@"The Pathfinder", ^{
    context(@"when asked to find the adjacent nodes", ^{
        PathfindingNode *node = [[PathfindingNode alloc] init];
        node.x = 4;
        node.y = 5;
        NSArray *adjacentNodes = [[Pathfinder sharedInstance] findAdjacentSquares:node];
        it(@"the adjacent nodes should exist.", ^{
            [[adjacentNodes shouldNot] beNil];
        });
        it(@"the adjacent nodes should be 4.", ^{
            [[adjacentNodes should] haveCountOf:4];
        });
    });
    context(@"when asked to calculate manhattan distance", ^{
        PathfindingNode *startNode = [[PathfindingNode alloc] init];
        startNode.x = -3;
        startNode.y = -10;
        
        PathfindingNode *targetNode = [[PathfindingNode alloc] init];
        targetNode.x = 5;
        targetNode.y = 3;
        
        int distance = [[Pathfinder sharedInstance] calculateManhattanDistanceBetweenStartNode:startNode targetNode:targetNode];
        it(@"the distance should be 7.", ^{
            [[theValue(distance) should] equal:theValue(21)];
        });
    });
    context(@"when asked to check if two nodes are equal", ^{
        PathfindingNode *node1 = [[PathfindingNode alloc] init];
        node1.x = -3;
        node1.y = -10;
        
        PathfindingNode *node2 = [[PathfindingNode alloc] init];
        node2.x = 5;
        node2.y = 3;
        
        BOOL areTheyEqual = [[Pathfinder sharedInstance] node:node1 isEqualToNode:node2];
        it(@"the nodes should not be equal", ^{
            [[theValue(areTheyEqual) should] equal:theValue(NO)];
        });
    });
});
SPEC_END