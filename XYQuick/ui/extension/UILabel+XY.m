//
//  UILabel+XY.m
//  JoinShow
//
//  Created by Heaven on 13-11-28.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import "UILabel+XY.h"

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define MB_TEXTSIZE(text, font) [text length] > 0 ? [text \
        sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero;
#else
#define MB_TEXTSIZE(text, font) [text length] > 0 ? [text sizeWithFont:font] : CGSizeZero;
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define MB_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
        boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) \
        attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero;
#else
#define MB_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
        sizeWithFont:font constrainedToSize:maxSize lineBreakMode:mode] : CGSizeZero;
#endif


@implementation UILabel (XY)

- (void)uxy_resize:(UXYLabelResizeType)type
{
    CGSize size;
    if (type == UXYLabelResizeType_constantHeight)
    {
        // 高不变
        size = [self uxy_estimateUISizeByHeight:self.bounds.size.height];
        if (!CGSizeEqualToSize(CGSizeZero, size))
        {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, self.bounds.size.height);
        }
    }
    else if (type == UXYLabelResizeType_constantWidth)
    {
        // 宽不变
        size = [self uxy_estimateUISizeByWidth:self.bounds.size.width];
        if (!CGSizeEqualToSize(CGSizeZero, size))
        {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.bounds.size.width, size.height);
        }
        
    }
}

- (CGSize)uxy_estimateUISizeByBound:(CGSize)bound
{
    if ( nil == self.text || 0 == self.text.length )
    {
        return CGSizeZero;
    }
    
	return MB_MULTILINE_TEXTSIZE(self.text, self.font, bound, self.lineBreakMode);
}

- (CGSize)uxy_estimateUISizeByWidth:(CGFloat)width
{
	if ( nil == self.text || 0 == self.text.length )
    {
        return CGSizeMake( width, 0.0f );
    }
		
    
	if ( self.numberOfLines )
	{
		return MB_MULTILINE_TEXTSIZE(self.text, self.font, CGSizeMake(width, self.font.lineHeight * self.numberOfLines + 1), self.lineBreakMode);
	}
	else
	{
		return MB_MULTILINE_TEXTSIZE(self.text, self.font, CGSizeMake(width, 999999.0f), self.lineBreakMode);
	}
}

- (CGSize)uxy_estimateUISizeByHeight:(CGFloat)height
{
	if ( nil == self.text || 0 == self.text.length )
    {
        return CGSizeMake( 0.0f, height );
    }
    
	return MB_MULTILINE_TEXTSIZE(self.text, self.font, CGSizeMake(999999.0f, height), self.lineBreakMode);
}
@end