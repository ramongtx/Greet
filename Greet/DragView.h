//
//  DragView.h
//  Greet
//
//  Created by Ramon Carvalho Maciel on 10/16/13.
//  Copyright (c) 2013 Rock Bottom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DragView : UIImageView

@property (nonatomic) BOOL lockOnX;
@property (nonatomic) BOOL lockOnY;
@property (nonatomic) BOOL sticky;

@property (nonatomic) CGFloat maxX;
@property (nonatomic) CGFloat minX;
@property (nonatomic) CGFloat maxY;
@property (nonatomic) CGFloat minY;

@property (nonatomic) float desaturation;


@end
