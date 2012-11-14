//
//  StartScreenViewController.m
//  101-BanglaBook-BornoPath
//
//  Created by Huq Majharul on 10/3/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "StartScreenViewController.h"
#import "OptionSelectionViewController.h"
#import "Constant.h"
#import "MyDevice.h"
#import "StaticSounds.h"
#import "SplashScreenView.h"

@implementation StartScreenViewController
@synthesize		soundID;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    splashScreenView = [[SplashScreenView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:splashScreenView];
    [self performSelector:@selector(startApp) withObject:nil afterDelay:0.5];
}

-(void)startApp
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.3];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    splashScreenView.alpha = 0.0;
    [UIView commitAnimations];
}

- (void)animationDidStop:(NSString*)animationID finished:(BOOL)finished context:(void *)context 
{
    [splashScreenView removeFromSuperview];
}
-(IBAction)actionGotoSwarBornoController
{
	NSString *soundPath = [[NSBundle mainBundle] pathForResource:SWAR_BORNO_SOUND ofType:nil];
	CFURLRef soundURL = (CFURLRef ) [NSURL fileURLWithPath:soundPath];
	AudioServicesCreateSystemSoundID (soundURL, &soundID);
	AudioServicesPlaySystemSound(soundID);
	
	NSString	*nib_name = IS_DEVICE_IPAD	? @"OptionSelectionViewController_iPad" : @"OptionSelectionViewController";
	OptionSelectionViewController	*controller = [[OptionSelectionViewController alloc]initWithNibName:nib_name 
																								bundle:[NSBundle mainBundle] 
																								withBornoType:BORNO_TYPE_SWARBORNO];
	[self.navigationController pushViewController:controller animated:YES];
	[controller release];
}

-(IBAction)actionGotoBanjonBornoController
{
	NSString *soundPath = [[NSBundle mainBundle] pathForResource:BANJON_BORNO_SOUND ofType:nil];
	CFURLRef soundURL = (CFURLRef ) [NSURL fileURLWithPath:soundPath];
	AudioServicesCreateSystemSoundID (soundURL, &soundID);
	AudioServicesPlaySystemSound(soundID);
	
	NSString	*nib_name = IS_DEVICE_IPAD	? @"OptionSelectionViewController_iPad" : @"OptionSelectionViewController";
	OptionSelectionViewController	*controller = [[OptionSelectionViewController alloc]initWithNibName:nib_name
																								bundle:[NSBundle mainBundle] 
																								withBornoType:BORNO_TYPE_BANJONBORNO];
	[self.navigationController pushViewController:controller animated:YES];
	[controller release];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return ((interfaceOrientation == UIDeviceOrientationLandscapeLeft) || (interfaceOrientation == UIDeviceOrientationLandscapeRight));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}


- (void)dealloc {
	AudioServicesDisposeSystemSoundID(soundID);
    [super dealloc];
}


@end
