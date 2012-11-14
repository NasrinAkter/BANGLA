//
//  BornoButton.m
//  BornoMala
//
//  Created by Huq Majharul on 4/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "BornoButton.h"
#import <QuartzCore/QuartzCore.h>
#import "Constant.h"

@implementation BornoButton

@synthesize image_path;
@synthesize sound_path;
@synthesize	delegate;
@synthesize	originalFrame;
@synthesize lastFrame;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
	if ([self isMultipleTouchEnabled]) {
		[super touchesBegan:touches withEvent:event];
	}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event 
{
	if ([self isMultipleTouchEnabled]) {
        [self setColorAppStyle:2.0f :0.5];
		[super touchesMoved:touches withEvent:event];
	}
	
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
{
	if ([self isMultipleTouchEnabled]) {
		[super touchesEnded:touches withEvent:event];
		        
        CGPoint midRect = CGPointMake(self.frame.origin.x + self.frame.size.width / 2, 
                                    self.frame.origin.y + self.frame.size.height / 2);
        
        if(CGRectContainsPoint(originalFrame,midRect))
        {
            self.multipleTouchEnabled = NO;
            [self gotoTargetFrameWithAnimation:originalFrame];
            
            [delegate playRightWrongSound:YES];
            [self setColorAppStyle:1.0f :0.2];
        }else {
            
            [self setColorAppStyle:1.0f :1.0];
            [self gotoTargetFrameWithAnimation:lastFrame];
            [delegate playRightWrongSound:NO];
        }
	}
}

-(void)gotoTargetPostionWithAnimation:(CGPoint)targetPoint
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    self.frame = CGRectMake(targetPoint.x, targetPoint.y, self.frame.size.width, self.frame.size.height);
    [UIView commitAnimations];
    
    self.lastFrame = self.frame;
}

-(void)gotoTargetFrameWithAnimation:(CGRect)targetFrame
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    
	self.frame = targetFrame;
    [UIView commitAnimations];
}

- (void)animationDidStop:(NSString*)animationID finished:(BOOL)finished context:(void *)context 
{
}

-(void)doActivateMoveProperty:(BOOL)flag
{
	self.multipleTouchEnabled = flag;
}

-(void)setCorrectMark
{
	UIImageView		*imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"correct.png"]];
	imgView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
	[self addSubview:imgView];
	[imgView release];
}
-(void)setColorAppStyle:(float)_borderWidth:(float)_alpha
{
	[self.layer setCornerRadius:4.0f];
	[self.layer setBorderColor:APP_THEME_COLOR.CGColor];
	[self.layer setBorderWidth:_borderWidth];
	self.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:_alpha];	
}

-(void)doZoomIn
{
	CABasicAnimation *trans = [CABasicAnimation animation];
	trans.keyPath = @"transform.scale";
	trans.repeatCount = 0;
	trans.duration = 0.3;
	trans.autoreverses = YES;
	trans.removedOnCompletion = NO;
	trans.fillMode = kCAFillModeForwards;
	trans.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	trans.fromValue = [NSNumber numberWithFloat:1.0];
	trans.toValue = [NSNumber numberWithFloat:1.2];
	[self.layer addAnimation:trans forKey:@"pulse"];	
}

-(void)handleSingleTapOnBackView:(UIGestureRecognizer *)sender
{
	[self.delegate actionButtonPressed:self];
	[self doZoomIn];
}

@end
