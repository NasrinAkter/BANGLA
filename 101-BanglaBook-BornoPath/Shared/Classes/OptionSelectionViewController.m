//
//  OptionSelectionViewController.m
//  101-BanglaBook-BornoPath
//
//  Created by Huq Majharul on 10/3/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "OptionSelectionViewController.h"

#import "BornoSikhiViewController.h"
#import "LekhaSikhiViewController.h"
#import "BornoShuneMilaiViewController.h"
#import "ChobiDekheBoliViewController.h"
#import "StaticSounds.h"
#import "Constant.h"
#import "MyDevice.h"

@implementation OptionSelectionViewController
@synthesize		optionSoundID;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withBornoType:(NSString*)type
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.bornoType = type;
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	indicatorLoading.hidden = YES;
	[buttonOptionType setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",self.bornoType]] forState:UIControlStateNormal];
}

-(void)gotoNextScreen:(NSString*)soundName
{
	self.view.userInteractionEnabled = YES;
	indicatorLoading.hidden = YES;
	[indicatorLoading stopAnimating];

	UIViewController	*controller ;
	NSString			*nib_name;
	if ([soundName isEqualToString:BORNO_SIKHI_SOUND]) {
		
		nib_name	= IS_DEVICE_IPAD	? @"BornoSikhiViewController_iPad" : @"BornoSikhiViewController";
		controller	= [[BornoSikhiViewController alloc]initWithNibName:nib_name bundle:[NSBundle mainBundle] withBornoType:self.bornoType];
		
	}else if ([soundName isEqualToString:LEKHA_SIKHI_SOUND]) {
		
		nib_name	= IS_DEVICE_IPAD	? @"LekhaSikhiViewController_iPad" : @"LekhaSikhiViewController";
		controller	= [[LekhaSikhiViewController alloc]initWithNibName:nib_name	bundle:[NSBundle mainBundle] withBornoType:self.bornoType];
		
	}else if ([soundName isEqualToString:CHOBI_DEKHE_MIALI_SOUND]) {
		
		nib_name	= IS_DEVICE_IPAD	? @"ChobiDekheBoliViewController_iPad" : @"ChobiDekheBoliViewController";
		controller	= [[ChobiDekheBoliViewController alloc]initWithNibName:nib_name bundle:[NSBundle mainBundle] withBornoType:self.bornoType];
		
	}else if ([soundName isEqualToString:BORNO_SHUNE_MILAI_SOUND]) {
		
		nib_name	= IS_DEVICE_IPAD	? @"BornoShuneMilaiViewController_iPad" : @"BornoShuneMilaiViewController";
		controller	= [[BornoShuneMilaiViewController alloc]initWithNibName:nib_name bundle:[NSBundle mainBundle] withBornoType:self.bornoType];
		
	}else {
		controller = nil;
	}

	
	[self.navigationController pushViewController:controller animated:YES];
	[controller release];
}

-(IBAction)actionGotoBornoSikhi:(id)sender
{
	NSString *soundPath = [[NSBundle mainBundle] pathForResource:BORNO_SIKHI_SOUND ofType:nil];
	CFURLRef soundURL = (CFURLRef ) [NSURL fileURLWithPath:soundPath];
	AudioServicesCreateSystemSoundID (soundURL, &optionSoundID);
	AudioServicesPlaySystemSound(optionSoundID);
	
	self.view.userInteractionEnabled = NO;
	indicatorLoading.hidden = NO;
	[indicatorLoading startAnimating];
	indicatorLoading.center = [(UIButton*)sender center];
	[self performSelector:@selector(gotoNextScreen:) withObject:BORNO_SIKHI_SOUND afterDelay:1.0];
}

-(IBAction)actionGotoLekhaSikhi:(id)sender
{
	NSString *soundPath = [[NSBundle mainBundle] pathForResource:LEKHA_SIKHI_SOUND ofType:nil];
	CFURLRef soundURL = (CFURLRef ) [NSURL fileURLWithPath:soundPath];
	AudioServicesCreateSystemSoundID (soundURL, &optionSoundID);
	AudioServicesPlaySystemSound(optionSoundID);
	
	self.view.userInteractionEnabled = NO;
	indicatorLoading.hidden = NO;
	[indicatorLoading startAnimating];
	indicatorLoading.center = [(UIButton*)sender center];
	[self performSelector:@selector(gotoNextScreen:) withObject:LEKHA_SIKHI_SOUND afterDelay:1.0];
}

-(IBAction)actionGotoChobiDekheBoli:(id)sender
{
	NSString *soundPath = [[NSBundle mainBundle] pathForResource:CHOBI_DEKHE_MIALI_SOUND ofType:nil];
	CFURLRef soundURL = (CFURLRef ) [NSURL fileURLWithPath:soundPath];
	AudioServicesCreateSystemSoundID (soundURL, &optionSoundID);
	AudioServicesPlaySystemSound(optionSoundID);
	
	self.view.userInteractionEnabled = NO;
	indicatorLoading.hidden = NO;
	[indicatorLoading startAnimating];
	indicatorLoading.center = [(UIButton*)sender center];
	[self performSelector:@selector(gotoNextScreen:) withObject:CHOBI_DEKHE_MIALI_SOUND afterDelay:1.0];
}

-(IBAction)actionGotoBornoShuneMilai:(id)sender
{
	NSString *soundPath = [[NSBundle mainBundle] pathForResource:BORNO_SHUNE_MILAI_SOUND ofType:nil];
	CFURLRef soundURL = (CFURLRef ) [NSURL fileURLWithPath:soundPath];
	AudioServicesCreateSystemSoundID (soundURL, &optionSoundID);
	AudioServicesPlaySystemSound(optionSoundID);
	
	self.view.userInteractionEnabled = NO;
	indicatorLoading.hidden = NO;
	[indicatorLoading startAnimating];
	indicatorLoading.center = [(UIButton*)sender center];
	[self performSelector:@selector(gotoNextScreen:) withObject:BORNO_SHUNE_MILAI_SOUND afterDelay:1.0];
}

-(IBAction)actionGotoHome
{
	NSString *soundPath = [[NSBundle mainBundle] pathForResource:HOME_SOUND ofType:nil];
	CFURLRef soundURL = (CFURLRef ) [NSURL fileURLWithPath:soundPath];
	AudioServicesCreateSystemSoundID (soundURL, &optionSoundID);
	AudioServicesPlaySystemSound(optionSoundID);
	
	[self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)actionBornoPress
{
    NSString    *soundName = (self.bornoType == BORNO_TYPE_SWARBORNO) ? SWAR_BORNO_SOUND : BANJON_BORNO_SOUND;
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:soundName ofType:nil];
	CFURLRef soundURL = (CFURLRef ) [NSURL fileURLWithPath:soundPath];
	AudioServicesCreateSystemSoundID (soundURL, &optionSoundID);
	AudioServicesPlaySystemSound(optionSoundID);

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

	[indicatorLoading release];
	indicatorLoading = nil;
	
	[buttonOptionType release];
	buttonOptionType = nil;
}


- (void)dealloc {
	AudioServicesDisposeSystemSoundID(optionSoundID);
    [super dealloc];
}


@end
