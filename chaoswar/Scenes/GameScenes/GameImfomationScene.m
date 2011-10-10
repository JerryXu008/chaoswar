//
//  GameImfomationScene.m
//  chaoswar
//
//  Created by Mac on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "GameImfomationScene.h"
#import "GameHintScene.h"
#import "GameController.h"
#import "SceneManager.h"
#import "SelectSence.h"

@implementation GameImfomationScene

-(id) init
{
	if( (self=[super init])) {
        //CGSize size = [[CCDirector sharedDirector] winSize];
		//暂停
		btnPause = [CCMenuItemImage itemFromNormalImage:@"pause_black.png" selectedImage:@"pause_normal.png"  
										  disabledImage:@"pause_black.png"  target:self selector:@selector(pauseGame:)];
		CCMenu *btnPauseMenu = [CCMenu menuWithItems:btnPause, nil];
		btnPauseMenu.position = ccp(446 , 300);
		[self addChild:btnPauseMenu z:2];
		
		//背景
		CCSprite *bottom = [CCSprite spriteWithFile:@"bottom_bg.png"];
		bottom.position = ccp(240 , 15);
		[self addChild:bottom z:1];
		
		//防御漏兵
		CCSprite *xueTip = [CCSprite spriteWithFile:@"xueTip.png"];
		xueTip.position = ccp(260 , 300);
		[self addChild:xueTip z:1];
		CCLabelTTF *lblTip = [CCLabelTTF labelWithString:@"" fontName:@"" fontSize:12];
		lblTip.position = ccp(260 , 300);
		[self addChild:lblTip z:1];
		
		//金额
		CCSprite *qianTip = [CCSprite spriteWithFile:@"qianTip.png"];
		qianTip.position = ccp(316 , 300);
		[self addChild:qianTip z:1];
		CCLabelTTF *lblQian = [CCLabelTTF labelWithString:@"" fontName:@"" fontSize:12];
		lblQian.position = ccp(260 , 300);
		[self addChild:lblQian z:1];
		
		//波数
		CCSprite *wavesTip = [CCSprite spriteWithFile:@"wavesTip.png"];
		wavesTip.position = ccp(370 , 300);
		[self addChild:wavesTip z:1];
		CCLabelTTF *lblWave = [CCLabelTTF labelWithString:@"" fontName:@"" fontSize:12];
		lblWave.position = ccp(260 , 300);
		[self addChild:lblWave z:1];
		
		//技能背景
		CCSprite *jiNengBg = [CCSprite spriteWithFile:@"jiNengBg.png"];
		jiNengBg.position = ccp(75 , 20);
		[self addChild:jiNengBg z:2];
    }
	return self;
}

-(void) pauseGame:(id) sender 
{
    [[CCDirector sharedDirector] pause];
	GameController *gc = [GameController getGameController];
	[gc.gameHint removeAllChildrenWithCleanup:YES];
	//背景
	CCSprite *pauseBg = [CCSprite spriteWithFile:@"pauseBg.png"];
	pauseBg.position = ccp(240 , 160);
	[gc.gameHint addChild:pauseBg z:1];
	
	//继续
	CCMenuItemImage *btnResume = [CCMenuItemImage itemFromNormalImage:@"btnResume.png" selectedImage:@"btnResume.png"  
									  disabledImage:@"btnResume.png"  target:self selector:@selector(Resume:)];
	CCMenu *btnResumeMenu = [CCMenu menuWithItems:btnResume, nil];
	btnResumeMenu.position = ccp(240 , 185);
	[gc.gameHint addChild:btnResumeMenu z:2];
	
	//菜单
	CCMenuItemImage *btnMenu = [CCMenuItemImage itemFromNormalImage:@"btnMenu.png" selectedImage:@"btnMenu.png"  
														disabledImage:@"btnMenu.png"  target:self selector:@selector(Menu:)];
	CCMenu *btnMenuMenu = [CCMenu menuWithItems:btnMenu, nil];
	btnMenuMenu.position = ccp(240 , 135);
	[gc.gameHint addChild:btnMenuMenu z:2];
	
	//重来
	CCMenuItemImage *btnRestart = [CCMenuItemImage itemFromNormalImage:@"btnRestart.png" selectedImage:@"btnRestart.png"  
													  disabledImage:@"btnRestart.png"  target:self selector:@selector(Restart:)];
	CCMenu *btnRestartMenu = [CCMenu menuWithItems:btnRestart, nil];
	btnRestartMenu.position = ccp(240 , 85);
	[gc.gameHint addChild:btnRestartMenu z:2];
}

-(void) Resume:(id) sender 
{
    [[CCDirector sharedDirector] resume];
	GameController *gc = [GameController getGameController];
	[gc.gameHint removeAllChildrenWithCleanup:YES];
}

-(void) Menu:(id) sender 
{
    [[CCDirector sharedDirector] resume];
	[[CCDirector sharedDirector] replaceScene: [SceneManager TransFade:0.56f scene:[SelectSence scene]]];
}

-(void) Restart:(id) sender 
{
    [[CCDirector sharedDirector] resume];
	GameController *gc = [GameController getGameController];
    [gc.gameHint removeAllChildrenWithCleanup:YES];
	[gc restart];
}

-(void) GoNext:(id) sender 
{
	GameController *gc = [GameController getGameController];
	[gc strartNextWave];
}

@end
