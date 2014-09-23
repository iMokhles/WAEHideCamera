#import <UIKit/UIKit.h>
#import <substrate.h>

%hook WAChatBar
- (void)layoutSubviews {
%orig;
	UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
	UIButton *cameraButton = MSHookIvar<UIButton *>(self, "_cameraButton");
	UIImageView *imageDiv = MSHookIvar<UIImageView *>(self, "_dividerImageView");
	UIView *inBox = MSHookIvar<UIView *>(self, "_inputBoxView");
	UITextView *inTextView = MSHookIvar<UITextView *>(self, "_inputTextView");
	// BOOL isActive = [inTextView isFirstResponder]; // Was For Testing
	[cameraButton removeFromSuperview];
	[imageDiv removeFromSuperview];
	if(orientation == 0) {
		[inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
		[inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
		if (![inTextView.text isEqualToString:@""]) {
			%orig;
		} else {
			[inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
			[inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
		}
	} else if(orientation == UIInterfaceOrientationPortrait) {
		[inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
		[inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
		if (![inTextView.text isEqualToString:@""]) {
			%orig;
		} else {
			[inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
			[inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
		}
	} else if(orientation == UIInterfaceOrientationLandscapeLeft) {
			[inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
			[inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
		if (![inTextView.text isEqualToString:@""]) {
			%orig;
		} else {
			[inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
			[inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
		}
	} else if(orientation == UIInterfaceOrientationLandscapeRight) {
			[inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
			[inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
		if (![inTextView.text isEqualToString:@""]) {
			%orig;
		} else {
			[inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
			[inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
		}
	}
}
%end