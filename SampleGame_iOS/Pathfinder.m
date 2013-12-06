//
//  Pathfinder.m
//  SampleGame
//
//  Created by Carlotta Tatti on 28/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "Pathfinder.h"
#import "LevelManager.h"

@interface Pathfinder ()
@property (strong, nonatomic) Level *level;
@end

@implementation Pathfinder

- (id)initWithLevel:(Level *)level {
    self = [super init];
    if (self) {
        _level = level;
    }
    return self;
}

+ (Pathfinder *)sharedInstance {
    static dispatch_once_t onceToken;
    static Pathfinder *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Pathfinder alloc] initWithLevel:[[LevelManager sharedInstance] currentLevel]];
    });
    return sharedInstance;
}
                            
- (NSArray *)findPathFrom:(CGPoint)start to:(CGPoint)target {
    NSMutableSet *openSet = [NSMutableSet new];
    NSMutableSet *closedSet = [NSMutableSet new];
    
    PathfindingNode *targetNode = [[PathfindingNode alloc] init];
    targetNode.x = target.x;
    targetNode.y = target.y;
    
    PathfindingNode *startNode = [[PathfindingNode alloc] init];
    startNode.x = start.x;
    startNode.y = start.y;
    startNode.g = 0;
    startNode.h = [self calculateManhattanDistanceBetweenStartNode:startNode targetNode:targetNode];
    startNode.f = startNode.g + startNode.h;
    
    [openSet addObject:startNode];
    
    while ([openSet count] > 0) {
        PathfindingNode *node = [self lowestFScoreNodeInSet:openSet];
        if ([self node:node isEqualToNode:targetNode]) {
            NSArray *path = [self reversePathFromNode:node];
            [[Logger sharedInstance] log:[NSString stringWithFormat:@"Found path! %i", path.count] sender:self];
            return path;
        }
        
        [openSet removeObject:node];
        [closedSet addObject:node];
        for (PathfindingNode *adjacent in [self findAdjacentSquares:node]) {
            if ([self isWalkable:adjacent]) {
                if ([closedSet containsObject:adjacent])
                    continue;
                
                int g = node.g + 1;
                BOOL isBetter;
                if (![openSet containsObject:adjacent]) {
                    [openSet addObject:adjacent];
                    isBetter = YES;
                } else if (g < adjacent.g) {
                    isBetter = YES;
                } else {
                    isBetter = NO;
                }
                
                if (isBetter) {
                    adjacent.parentNode = node;
                    adjacent.g = g;
                    adjacent.h = [self calculateManhattanDistanceBetweenStartNode:adjacent targetNode:targetNode];
                    adjacent.f = adjacent.g + adjacent.h;
                }
            }
        }
    }
    return nil;
}

/** Check if node is walkable */
- (BOOL)isWalkable:(PathfindingNode *)node {
    if (![_level hasProperty:kPropertyCollidable atTile:ccp(node.x, node.y)] || ![_level hasProperty:kPropertyNPC atTile:ccp(node.x, node.y)]) {
        return YES;
    }
    return NO;
}

/** Reverse the path starting from the end node to find the route */
- (NSArray *)reversePathFromNode:(PathfindingNode *)endNode {
    NSMutableArray *finalPath = [NSMutableArray new];
    PathfindingNode *node = endNode;
    do {
        if (node.parentNode != nil) {
            [finalPath addObject:node];
        }
        node = node.parentNode;
    } while (node != nil);
    
    return finalPath;
}

/** Calculate manhattan distance */
- (int)calculateManhattanDistanceBetweenStartNode:(PathfindingNode *)currentNode targetNode:(PathfindingNode *)targetNode {
    int x1 = currentNode.x;
    int x2 = targetNode.x;
    int y1 = currentNode.y;
    int y2 = targetNode.y;
    
    int distance = abs(x1-x2) + abs(y1-y2);
    
    return distance;
}

/** Pick node with lowest F score */
- (PathfindingNode *)lowestFScoreNodeInSet:(NSMutableSet *)set {
    PathfindingNode *lowestScoreNode = [set anyObject];
    for (PathfindingNode *node in [set allObjects]) {
        if (node.f < lowestScoreNode.f) {
            lowestScoreNode = node;
        }
    }
    
    return lowestScoreNode;
}

/** Check if node1 is equal to node2 */
- (BOOL)node:(PathfindingNode *)node1 isEqualToNode:(PathfindingNode *)node2 {
    if (node1.x == node2.x && node1.y == node2.y) {
        return YES;
    }
    
    return NO;
}

/** Find adjacent nodes for given node. */
- (NSArray *)findAdjacentSquares:(PathfindingNode *)node {
    NSMutableArray *adjSquares = [NSMutableArray new];
    
    for (int x = -1; x <= 1; x++) {
        for (int y = -1; y <= 1; y++) {
            BOOL isDiagonal = abs(x) + abs(y) == 2;
            BOOL isTheSame = abs(x) + abs(y) == 0;
            if (!isDiagonal && !isTheSame) {
                PathfindingNode *n = [[PathfindingNode alloc] init];
                n.x = node.x + x;
                n.y = node.y + y;
                [adjSquares addObject:n];
            }
        }
    }
    
    return adjSquares;
}

@end
