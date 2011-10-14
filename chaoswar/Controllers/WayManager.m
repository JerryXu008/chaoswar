//
//  WayManager.m
//  chaoswar
//
//  Created by Mac on 11-10-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "WayManager.h"
#import "WayPoint.h"

@implementation WayManager


- (id) init
{
	if ((self = [super init])) {
        dicWay = [[NSMutableDictionary alloc] init];
	}
	return self;
}

- (void)dealloc {
    [self removeAllWay];
    [dicWay release];
	[super dealloc];
}

- (void) removeAllWay
{
    NSArray *keys = [dicWay allKeys];
    for (int i = 0; i < keys.count; i++) {
        NSMutableArray *way = [dicWay objectForKey:[keys objectAtIndex:i]];
        [way removeAllObjects];
    }
    [dicWay removeAllObjects];
}

- (void) addWayPoint:(int)roadNum wayPoint:(CGPoint)wayPoint z:(int)z
{
    NSMutableArray *way = [dicWay objectForKey:[NSString stringWithFormat:@"%d", roadNum]];
    if (!way) {
        [dicWay setObject:[NSMutableArray array] forKey:[NSString stringWithFormat:@"%d", roadNum]];
        [self addWayPoint:roadNum wayPoint:wayPoint z:z];
        return;
    }
    [way addObject:[WayPoint getWayPoint:wayPoint z:z]];
}

- (NSMutableArray*) getWay:(int)roadNum
{
    NSMutableArray *way = [dicWay objectForKey:[NSString stringWithFormat:@"%d", roadNum]];
    if (!way) {
        return nil;
    }
    return way;
}

- (CGPoint) getWayPoint:(int)roadNum num:(int)num
{
    NSMutableArray *way = [dicWay objectForKey:[NSString stringWithFormat:@"%d", roadNum]];
    if (!way) {
        return ccp(-100, -100);
    }
    WayPoint *wayPoint = [way objectAtIndex:num];
    if (wayPoint) {
        return [wayPoint getPoint];
    }
    return ccp(-100, -100);
}

@end
