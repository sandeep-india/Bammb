//
//  ViewController.m
//  ShouldI
//
//  Created by Apple on 05/06/14.
//  Copyright (c) 2014 mnm, Inc. All rights reserved.
//

#import "ViewController.h"
#import "POP.h"
#import "CSAnimationView.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()


@end

@implementation ViewController{
    UIImageView *imgView;
    UITextView *textView;
    UITextField *textField;
    UIView *anim3;
    UILabel *placeholderText;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.view.tintColor = [self colorWithHexString:@"e24d2b"];
    self.view.backgroundColor = [UIColor whiteColor];
	// Do any additional setup after loading the view, typically from a nib.
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(40,164,240,240)];
    imgView.image = [UIImage imageNamed:@"logo"];
    [self.view addSubview:imgView];
    
    anim3 = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,568)];
    anim3.backgroundColor = [self colorWithHexString:@"2ad4ca"];
    [self.view addSubview:anim3];
    [self performSelector:@selector(fadeColor) withObject:nil afterDelay:2.0];
    
    [self.view addSubview:imgView];
    [self performSelector:@selector(animateLogo) withObject:nil afterDelay:2.0];
    

}

-(void) animateLogo{
    
    POPDecayAnimation *anim = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    anim.velocity = @(-1200.0);
    [imgView.layer pop_addAnimation:anim forKey:@"slide"];
    [self performSelector:@selector(addLabel1) withObject:nil afterDelay:0.6];
    
    


    
//    POPBasicAnimation *anim1 = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
//    anim1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//    anim1.fromValue = @(1.0);
//    anim1.toValue = @(0.0);
//    [imgView.layer pop_addAnimation:anim1 forKey:@"fade1"];
    
}

-(void) addLabel1{
    
    UIFont * customFont = [UIFont fontWithName:@"Avenir-Light" size:30]; //custom font
    NSString * text = @"This week I’d like to";
    CGSize labelSize = [text sizeWithFont:customFont constrainedToSize:CGSizeMake(380, 20) lineBreakMode:NSLineBreakByTruncatingTail];
    
    
    
    CSAnimationView *animationView = [[CSAnimationView alloc] initWithFrame:CGRectMake((320-labelSize.width)/2,115,labelSize.width,labelSize.height)];
    animationView.duration = 0.5;
    animationView.delay    = 0.1;
    animationView.type     = CSAnimationTypeFadeInUp;
    UILabel *fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0,labelSize.width,labelSize.height)];
    fromLabel.text = text;
    fromLabel.font = customFont;
    fromLabel.numberOfLines = 1;
    fromLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    fromLabel.adjustsFontSizeToFitWidth = YES;
    fromLabel.adjustsLetterSpacingToFitWidth = YES;
    fromLabel.minimumScaleFactor = 10.0f/12.0f;
    fromLabel.clipsToBounds = YES;
    fromLabel.backgroundColor = [UIColor clearColor];
    fromLabel.textColor = [self colorWithHexString:@"2ad4ca"];
    fromLabel.textAlignment = NSTextAlignmentCenter;
    [animationView addSubview:fromLabel];
    [self.view addSubview:animationView];
    [animationView startCanvasAnimation];
    
    [self performSelector:@selector(addTextView) withObject:nil afterDelay:0.1];
    
}


//-(void) addLabel2{
//
//    UIFont * customFont = [UIFont fontWithName:@"Helvetica" size:23]; //custom font
//    NSString * text1 = @"consectetur adipiscing elit?";
//    CGSize labelSize1 = [text1 sizeWithFont:customFont constrainedToSize:CGSizeMake(380, 20) lineBreakMode:NSLineBreakByTruncatingTail];
//    
//    CSAnimationView *animationView1 = [[CSAnimationView alloc] initWithFrame:CGRectMake((320-labelSize1.width)/2,140,labelSize1.width,labelSize1.height)];
//    animationView1.duration = 0.5;
//    animationView1.delay    = 0.1;
//    animationView1.type     = CSAnimationTypeFadeInUp;
//    
//    UILabel *fromLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0,0,labelSize1.width,labelSize1.height)];
//    
//    fromLabel1.text = text1;
//    fromLabel1.font = customFont;
//    fromLabel1.numberOfLines = 1;
//    fromLabel1.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
//    fromLabel1.adjustsFontSizeToFitWidth = YES;
//    fromLabel1.adjustsLetterSpacingToFitWidth = YES;
//    fromLabel1.minimumScaleFactor = 10.0f/12.0f;
//    fromLabel1.clipsToBounds = YES;
//    fromLabel1.backgroundColor = [UIColor clearColor];
//    fromLabel1.textColor = [UIColor greenColor];
//    fromLabel1.textAlignment = NSTextAlignmentCenter;
//    
//    [animationView1 addSubview:fromLabel1];
//    [self.view addSubview:animationView1];
//    [animationView1 startCanvasAnimation];
//    
//    [self performSelector:@selector(addFeild) withObject:nil afterDelay:0.1];
//    
//}
//
//
//-(void) addFeild{
//    
//    UIFont * customFont = [UIFont fontWithName:@"Avenir-Light" size:30]; //custom font
//    
//    textField = [[UITextField alloc] initWithFrame:CGRectMake(0,0,260,40)];
//    textField.layer.masksToBounds=YES;
//    textField.layer.borderColor=[[UIColor clearColor]CGColor];
//    textField.layer.borderWidth= 1.0f;
//    
//    CSAnimationView *animationView1 = [[CSAnimationView alloc] initWithFrame:CGRectMake(30,155,260,40)];
//    animationView1.duration = 0.5;
//    animationView1.delay    = 0.1;
//    animationView1.type     = CSAnimationTypeFadeInUp;
//
//    
//    textField.borderStyle = UITextBorderStyleNone;
//    textField.font = customFont;
//    //textField.placeholder = @"edit photographs";
//    NSString *placeholderText = @"edit photographs";
//    UIColor *color = [self colorWithHexString:@"d7f2f0"];
//    
//    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholderText attributes:@{NSForegroundColorAttributeName: color}];
//    textField.textColor = [self colorWithHexString:@"e24d2b"];
//    
//    textField.autocorrectionType = UITextAutocorrectionTypeNo;
//    textField.keyboardType = UIKeyboardTypeDefault;
//    textField.returnKeyType = UIReturnKeyDone;
//    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    textField.delegate = self;
//    
//    [animationView1 addSubview:textField];
//    [self.view addSubview:animationView1];
//    [animationView1 startCanvasAnimation];
//    [self performSelector:@selector(addButton) withObject:nil afterDelay:0.1];
//    
//}

-(void) addTextView{
    
    UIFont * customFont = [UIFont fontWithName:@"Avenir-Light" size:30]; //custom font
    
    textView = [[UITextView alloc]initWithFrame:CGRectMake(0,0,260,90)];
    textView.font = customFont;
    textView.layer.borderColor=[[UIColor clearColor]CGColor];
    textView.backgroundColor = [UIColor clearColor];
    textView.scrollEnabled = YES;
    textView.pagingEnabled = NO;
    textView.editable = YES;
    textView.textColor = [self colorWithHexString:@"e24d2b"];
    CSAnimationView *animationView1 = [[CSAnimationView alloc] initWithFrame:CGRectMake(30,155,260,90)];
    animationView1.duration = 0.5;
    animationView1.delay    = 0.1;
    animationView1.type     = CSAnimationTypeFadeInUp;
    
    textView.autocorrectionType = UITextAutocorrectionTypeNo;
    textView.keyboardType = UIKeyboardTypeTwitter;
    textView.returnKeyType = UIReturnKeyDone;
    textView.delegate = self;
    
    [animationView1 addSubview:textView];
    [self.view addSubview:animationView1];
    [animationView1 startCanvasAnimation];
    
    
    [self performSelector:@selector(addButton) withObject:nil afterDelay:0.1];
    
    
}

-(void) addButton{
    
    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    playButton.frame = CGRectMake(0,0,260,60);
    [playButton setImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
    [playButton setImage:[UIImage imageNamed:@"buttonhigh"] forState:UIControlStateHighlighted];
    
    CSAnimationView *animationView = [[CSAnimationView alloc] initWithFrame:CGRectMake(30,262,260,40)];
    animationView.duration = 0.5;
    animationView.delay    = 0.1;
    animationView.type     = CSAnimationTypeFadeInUp;
    
    //[playButton setImage:[UIImage imageNamed:@"buttonhigh"] forState:UIControlStateHighlighted];
    [playButton addTarget:self action:@selector(playAction) forControlEvents:UIControlEventTouchUpInside];
    [animationView addSubview:playButton];
    [self.view addSubview:animationView];
    [animationView startCanvasAnimation];
    [self performSelector:@selector(showKeys) withObject:nil afterDelay:0.6];
    [self performSelector:@selector(addinfo) withObject:nil afterDelay:0.6];

}

-(void) addinfo{
    
    UIButton *iButton = [UIButton buttonWithType:UIButtonTypeCustom];
    iButton.frame = CGRectMake(0,0,30,30);
    [iButton setImage:[UIImage imageNamed:@"i"] forState:UIControlStateNormal];
    [iButton setImage:[UIImage imageNamed:@"ihover"] forState:UIControlStateHighlighted];
    
    CSAnimationView *animationView = [[CSAnimationView alloc] initWithFrame:CGRectMake(275,15,30,30)];
    animationView.duration = 0.5;
    animationView.delay    = 0.1;
    animationView.type     = CSAnimationTypeFadeIn;
    
    //[playButton setImage:[UIImage imageNamed:@"buttonhigh"] forState:UIControlStateHighlighted];
    [iButton addTarget:self action:@selector(iAction) forControlEvents:UIControlEventTouchUpInside];
    [animationView addSubview:iButton];
    [self.view addSubview:animationView];
    [animationView startCanvasAnimation];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    return textView.text.length + (text.length - range.length) <=50;
}

-(void) showKeys{
    [textView becomeFirstResponder];
}

-(void) iAction{

}

-(void) playAction{
    
}



-(void) fadeColor{
    
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    anim.fromValue = @(1.0);
    anim.toValue = @(0.0);
    [anim3 pop_addAnimation:anim forKey:@"fade"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

- (BOOL) prefersStatusBarHidden
{
    return YES;
}

@end
