//
//  BornoButton.h
//  BornoMala
//
//  Created by Huq Majharul on 4/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SoundImageObject.h"

@protocol BornoButtonDelegate <NSObject>

@required
-(void)actionButtonPressed:(id)sender;
@optional
-(void)playRightWrongSound:(BOOL)isRight;
@end


@interface BornoButton : SoundImageObject {
	
	NSString		*image_path;
	NSString		*sound_path;
	
	id <BornoButtonDelegate>			delegate;
	
	CGRect			originalFrame;
    CGRect			lastFrame;
    
}

@property (nonatomic, assign) id <BornoButtonDelegate> delegate;
@property (nonatomic, retain) NSString	*image_path;
@property (nonatomic, retain) NSString	*sound_path;
@property (nonatomic, assign) CGRect	originalFrame;
@property (nonatomic, assign) CGRect	lastFrame;

-(void)gotoTargetFrameWithAnimation:(CGRect)targetFrame;
-(void)gotoTargetPostionWithAnimation:(CGPoint)targetPoint;

-(void)setColorAppStyle:(float)_borderWidth:(float)_alpha;
-(void)setCorrectMark;

-(void)doActivateMoveProperty:(BOOL)flag;

@end
