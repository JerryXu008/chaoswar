//
//  SelectSence.m
//  Defend
//
//  Created by apple on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "SelectSence.h"
#import "MainMenuSence.h"
#import "UpdataSence.h"
#import "SceneManager.h"
#import "GameBackgroundScene.h"
#import "LoadingSence.h"

@implementation SelectSence

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	SelectSence *layer = [SelectSence node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
        CGSize size = [[CCDirector sharedDirector] winSize];
        //加载背景图片
        bgImg = [CCSprite spriteWithFile:@"selectWaveBg.png"];
		bgImg.position = CGPointMake(size.width /2 , size.height/2);
		bgImg.scale = 1;
		[self addChild:bgImg z:1];
        
        //加载返回按钮
		btnBack = [[CCMenuItemImage alloc] initFromNormalImage:@"btnBack.png" selectedImage:@"btnBackDown.png" disabledImage:@"btnBack.png" target:self selector:@selector(goToMainMenuSence:)];		
        CCMenu *btnBackMenu = [CCMenu menuWithItems:btnBack, nil];
		btnBackMenu.position = CGPointMake(450 , 30);
		[self addChild:btnBackMenu z:2];
        
        //加载升级按钮
		btnUpdata = [[CCMenuItemImage alloc] initFromNormalImage:@"btnUpdate.png" selectedImage:@"btnUpdateDown.png" disabledImage:@"btnUpdate.png" target:self selector:@selector(goToUpdataSence:)];		
        CCMenu *btnUpdataMenu = [CCMenu menuWithItems:btnUpdata, nil];
		btnUpdataMenu.position = CGPointMake(375 , 30);
		[self addChild:btnUpdataMenu z:2];
        
        //加载关卡及分数
        NSString *errorDesc = nil;
        NSPropertyListFormat format;
        NSString *plistPath = [CCFileUtils fullPathFromRelativePath:@"WaveSelectList.plist"];
        if ([[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
			//NSLog(@"Not exsit");
            NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
            wavesInfo = (NSMutableDictionary *)[NSPropertyListSerialization
                                                propertyListFromData:plistXML
                                                mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                                format:&format
                                                errorDescription:&errorDesc];
            
            if (!wavesInfo) {
                NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
            }

            NSDictionary* waves = [wavesInfo objectForKey:@"Waves" ];
            NSDictionary *wave;
            CGPoint waveStationPo;
            CCMenuItemImage *btnWaveStation;
            CCSprite *waveScore;
            int score;
            int isCanPLay;
            
            for (id key in waves) {
                wave = [waves objectForKey:key];
                waveStationPo = CGPointFromString([wave objectForKey:@"position"]);
                isCanPLay = [(NSNumber*)[wave objectForKey:@"open"] intValue];
                
                if (isCanPLay == 1) {
                    btnWaveStation = [[CCMenuItemImage alloc] initFromNormalImage:@"btnWaveStation.png" selectedImage:@"btnWaveStation.png" disabledImage:@"btnWaveStation.png" target:self  selector:@selector(goToLoadingSence:)];
                    btnWaveStation.scale = 1;
                    btnWaveStation.tag = [(NSNumber*)[wave objectForKey:@"id"] intValue];
                    CCMenu *btnWaveStationMenu = [CCMenu menuWithItems:btnWaveStation, nil];
                    btnWaveStationMenu.position = waveStationPo;
                    [self addChild:btnWaveStationMenu z:2];
                    [btnWaveStation release];
                    
                    score = [(NSNumber*)[wave objectForKey:@"score"] intValue];
                    
                    for (int i=0; i < score; i++) {
                        waveScore = [CCSprite spriteWithFile:@"starLight.png"];
                        waveScore.position = CGPointMake(waveStationPo.x - 15 + (i * 15), waveStationPo.y + 35);
                        [self addChild:waveScore z:2];
                    }
                    
                    for (int i=score; i < 3; i++) {
                        waveScore = [CCSprite spriteWithFile:@"starLightHui.png"];
                        waveScore.position = CGPointMake(waveStationPo.x - 15 + (i * 15), waveStationPo.y + 35);
                        [self addChild:waveScore z:2];
                    }
                }        
            }
        }
	}
	return self;
}

-(void) goToLoadingSence:(id) sender 
{
    CCMenuItemImage *button = sender;
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransFade:0.56f scene:[LoadingSence scene:button.tag]]];
}

-(void) goToMainMenuSence:(id) sender 
{
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransFadeDown:0.56f layer:[MainMenuSence node]]];
}

-(void) goToUpdataSence:(id) sender 
{
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransZoomFlipX:0.56f layer:[UpdataSence node]]];
}

- (void) dealloc
{
	[super dealloc];
}

@end
