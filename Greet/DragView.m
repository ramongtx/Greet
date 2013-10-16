//
//  DragView.m
//  Greet
//
//  Created by Ramon Carvalho Maciel on 10/16/13.
//  Copyright (c) 2013 Rock Bottom. All rights reserved.
//

#import "DragView.h"

@implementation DragView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self baseInit];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (void) baseInit
{
    self.lockOnY = YES;
    self.lockOnX = NO;
    self.sticky = YES;
    self.minX = self.center.x;
    self.maxX = self.center.x + 175;
    self.minY = self.center.y;
    self.maxY = self.center.y + 175;
    self.desaturation = 0;
}

- (void)touchesMoved:(NSSet *)set withEvent:(UIEvent *)event {
    CGPoint p = [[set anyObject] locationInView:self.superview];
    
    CGPoint k;
    
    if (self.lockOnY) k.y = self.center.y;
    else k.y = p.y;
    
    if (self.lockOnX) k.x = self.center.x;
    else k.x = p.x;
    
    self.center = k;
}

-(void)setSaturation:(float)sat;
{
    self.desaturation = sat;
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextTranslateCTM(context, 0.0, self.bounds.size.height); // flip image right side up
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextDrawImage(context, rect, self.image.CGImage);
    CGContextSetBlendMode(context, kCGBlendModeSaturation);
    CGContextClipToMask(context, self.bounds, self.image.CGImage); // restricts drawing to within alpha channel
    CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, self.desaturation);
    CGContextFillRect(context, rect);
    self.backgroundColor = [UIColor colorWithHue:100 saturation:self.desaturation brightness:0.5 alpha:1];
    
    CGContextRestoreGState(context); // restore state to reset blend mode
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint k;
    k = self.center;
    

    if (!self.lockOnX) {
        if (self.center.x < self.minX) k.x = self.minX;
        if (self.center.x > self.maxX) k.x = self.maxX;
        
    }
    if (!self.lockOnY) {
        if (self.center.y < self.minY) k.y = self.minY;
        if (self.center.y > self.maxY) k.y = self.maxY;
    }
    if (self.sticky) {
        CGFloat xm, ym;
        xm = (self.maxX - self.minX)/2;
        ym = (self.maxY - self.minY)/2;
        
        if (!self.lockOnX) {
            if ((k.x+xm)>=self.maxX) k.x = self.maxX;
            else k.x = self.minX;
        }
        
        if (!self.lockOnY) {
            if ((k.y+xm)>=self.maxX) k.y = self.maxX;
            else k.y = self.minX;
        }
    }
    self.center = k;
    [self setSaturation:(k.x-self.minX)/self.maxX];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
