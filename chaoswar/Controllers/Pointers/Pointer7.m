#import "Pointer7.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer7

- (void) initController
{
    GameController *gc = [GameController getGameController];
	gc.maxWave = 16;
	gc.currentWave = 0;
	gc.currentHealth = 20;
	gc.currentGold = 320;
	gc.screenClickType = SCT_ALL;
	gc.operateType = OT_NORMAL;
	gc.mapType = MT_SAND;
	gc.canNext = YES;
}

- (void) initEnemy:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (void) initTower:(NSMutableArray*)array
{
    [array removeAllObjects];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(198, 103) s:CGPointZero];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(136, 103) s:CGPointZero];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(75, 103) s:CGPointZero];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(216, 231) s:CGPointZero];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(331, 132) s:CGPointZero];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(392, 132) s:CGPointZero];
}

- (BOOL) runWaves:(int)wave
{
    GameController *gc = [GameController getGameController];
	switch (wave) {
		case 1:
            [self runWave:1 e:ET_FOOT4 s:2 t:3 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:22];
			break;
        case 2:
			[self runWave:1 e:ET_FOOT5 s:2 t:3 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT3 s:2 t:5 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:22];
			break;
        case 3:
			[self runWave:1 e:ET_FOOT5 s:2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_MAGIC1 s:4 t:2 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:25];
			break;
        case 4:
            //new enemy
			[self runWave:1 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:20];
			break;
        case 5:
            [self runWave:1 e:ET_FOOT6 s:2 t:3 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT8 s:2 t:3 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:20];
			break;
        case 6:
            [self runWave:1 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:20];
			break;
        case 7:
			[self runWave:1 e:ET_FOOT8 s:2 t:3 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT2 s:2 t:5 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT7 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:23];
			break;
        case 8:
			[self runWave:1 e:ET_FOOT4 s:2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT11 s:4 t:2 wy:[gc.wayManager getWay:2]];

            [self prepareNextWave:25];
			break;
        case 9:
			[self runWave:1 e:ET_FOOT4 s:2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT11 s:4 t:2 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:25];
			break;
        case 10:
            [self runWave:1 e:ET_FOOT10 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:23];
			break;
        case 11:
            //new enemy
            [self runWave:1 e:ET_FOOT12 s:3 t:4 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:23];
			break;
        case 12:
            [self runWave:1 e:ET_FOOT10 s:2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT12 s:3 t:2 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT7 s:2 t:3 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:25];
			break;
        case 13:
            [self runWave:1 e:ET_FOOT10 s:2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT12 s:3 t:3 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT7 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT2 s:2 t:5 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:25];
			break;
        case 14:
            [self runWave:1 e:ET_FOOT10 s:2 t:6 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT12 s:3 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT5 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self runWave:1 e:ET_MAGIC1 s:4 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:25];
			break;
        case 15:
            [self runWave:1 e:ET_FOOT10 s:2 t:7 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT12 s:3 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT9 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:25];
			break;
        case 16:
            [self runWave:1 e:ET_FOOT10 s:2 t:8 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT12 s:3 t:5 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT9 s:3 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT8 s:2 t:5 wy:[gc.wayManager getWay:6]];
            //[self prepareNextWave:10];
			break;
		default:
            [self prepareNextWave:10];
			break;
	}
	gc.canNext = NO;
    [gc setGameStatus];
    return YES;
}

- (void) initBullety:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (void) initWayPoint:(WayManager*)manager
{
    [manager removeAllWay];
    [manager addWayPoint:1 wayPoint:ccp(-1, 205)];
    [manager addWayPoint:1 wayPoint:ccp(276, 205)];
    [manager addWayPoint:1 wayPoint:ccp(276, 105)];
    [manager addWayPoint:1 wayPoint:ccp(481, 105)];
    
    [manager addWayPoint:2 wayPoint:ccp(-1, 187)];
    [manager addWayPoint:2 wayPoint:ccp(264, 187)];
    [manager addWayPoint:2 wayPoint:ccp(264, 87)];
    [manager addWayPoint:2 wayPoint:ccp(481, 87)];
    
    [manager addWayPoint:3 wayPoint:ccp(-1, 168)];
    [manager addWayPoint:3 wayPoint:ccp(250, 168)];
    [manager addWayPoint:3 wayPoint:ccp(250, 68)];
    [manager addWayPoint:3 wayPoint:ccp(481, 68)];
    
    [manager addWayPoint:4 wayPoint:ccp(137, 321)];
    [manager addWayPoint:4 wayPoint:ccp(137, 168)];
    [manager addWayPoint:4 wayPoint:ccp(250, 168)];
    [manager addWayPoint:4 wayPoint:ccp(250, 68)];
    [manager addWayPoint:4 wayPoint:ccp(481, 68)];
    
    [manager addWayPoint:5 wayPoint:ccp(151, 321)];
    [manager addWayPoint:5 wayPoint:ccp(151, 186)];
    [manager addWayPoint:5 wayPoint:ccp(264, 186)];
    [manager addWayPoint:5 wayPoint:ccp(264, 87)];
    [manager addWayPoint:5 wayPoint:ccp(481, 87)];
    
    [manager addWayPoint:6 wayPoint:ccp(165, 321)];
    [manager addWayPoint:6 wayPoint:ccp(165, 205)];
    [manager addWayPoint:6 wayPoint:ccp(276, 205)];
    [manager addWayPoint:6 wayPoint:ccp(276, 105)];
    [manager addWayPoint:6 wayPoint:ccp(481, 105)];
}

- (void) initFriendly:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (BOOL) isWhite:(CGPoint)point
{
    if (point.x > 0 && point.x < 293 && point.y > 162 && point.y < 219) {
        return YES;
    }
    
    if (point.x > 122 && point.x < 181 && point.y > 162 && point.y < 480) {
        return YES;
    }
    
    if (point.x > 235 && point.x < 294 && point.y > 62 && point.y < 219) {
        return YES;
    }
    
    if (point.x > 235 && point.x < 480 && point.y > 62 && point.y < 121) {
        return YES;
    }
    
    return NO;
}

- (void) doAutoNextWave
{
    [super doAutoNextWave];
    switch ([GameController getGameController].currentWave) {
		case 1:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 192)];
            [self addWaveTip:ccp(152, 297)];
			break;
        case 2:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 192)];
            [self addWaveTip:ccp(152, 297)];
			break;
        case 3:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 192)];
            //[self addWaveTip:ccp(152, 297)];
			break;
        case 4:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 192)];
            [self addWaveTip:ccp(152, 297)];
			break;
        case 5:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 192)];
            [self addWaveTip:ccp(152, 297)];
			break;
        case 6:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 192)];
            [self addWaveTip:ccp(152, 297)];
			break;
        case 7:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 192)];
            [self addWaveTip:ccp(152, 297)];
			break;
        case 8:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 192)];
            [self addWaveTip:ccp(152, 297)];
			break;
        case 9:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 192)];
            [self addWaveTip:ccp(152, 297)];
			break;
        case 10:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 192)];
            //[self addWaveTip:ccp(152, 297)];
			break;
        case 11:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 192)];
            [self addWaveTip:ccp(152, 297)];
			break;
        case 12:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 192)];
            [self addWaveTip:ccp(152, 297)];
			break;
        case 13:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 192)];
            [self addWaveTip:ccp(152, 297)];
			break;
        case 14:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 192)];
            [self addWaveTip:ccp(152, 297)];
			break;
        case 15:
            [self autoNextWave:10 mustGold:10 addGold:1];
            [self addWaveTip:ccp(15, 192)];
            [self addWaveTip:ccp(152, 297)];
			break;
        case 16:
			break;
            
		default:
            //[self prepareNextWave:10];
			break;
	}
}

@end
