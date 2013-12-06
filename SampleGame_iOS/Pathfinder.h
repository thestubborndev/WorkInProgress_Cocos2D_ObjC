//
//  Pathfinder.h
//  SampleGame
//
//  Created by Carlotta Tatti on 28/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PathfindingNode.h"

@interface Pathfinder : NSObject

/** Pathfinder singleton */
+ (Pathfinder *)sharedInstance;

/** Find the path from start to target */
- (NSArray *)findPathFrom:(CGPoint)start to:(CGPoint)target;

/** Check if node is walkable */
- (BOOL)isWalkable:(PathfindingNode *)node;

/** Reverse the path starting from the end node to find the route */
- (NSArray *)reversePathFromNode:(PathfindingNode *)endNode;

/** Calculate manhattan distance */
- (int)calculateManhattanDistanceBetweenStartNode:(PathfindingNode *)currentNode targetNode:(PathfindingNode *)targetNode;

/** Pick node with lowest F score */
- (PathfindingNode *)lowestFScoreNodeInSet:(NSMutableSet *)set;

/** Check if node1 is equal to node2 */
- (BOOL)node:(PathfindingNode *)node1 isEqualToNode:(PathfindingNode *)node2;

/** Find adjacent nodes for given node. */
- (NSArray *)findAdjacentSquares:(PathfindingNode *)node;

@end
