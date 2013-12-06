//
//  Item.h
//  SampleGame
//
//  Created by Carlotta Tatti on 02/12/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "GameObject.h"

@interface Item : GameObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) BOOL pickable;

- (id)initWithName:(NSString *)name pickable:(BOOL)pickable;

@end
