//
//  OTGCommonClass.m
//  OTGanttChartView
//
//  Created by Tomosuke Okada on 2017/08/01.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//
//  https://github.com/PKPK-Carnage/OTGanttChartKit

/**
 [OTGanttChartView]
 
 Copyright (c) [2017] [Tomosuke Okada]
 
 This software is released under the MIT License.
 http://opensource.org/licenses/mit-license.ph
 
 */

#import "OTGCommonClass.h"

static NSCalendar *calendar;
static NSDateFormatter *dateFormatter;

@implementation OTGCommonClass

#pragma mark - Color
+ (UIColor *)hexToUIColor:(NSString *)hex alpha:(CGFloat)alpha
{
    if ([hex length] == 0) {
        return [UIColor colorWithWhite:1.0 alpha:alpha];
    }
    
    NSString *firstStr = [hex substringToIndex:1];
    if ([firstStr isEqualToString:@"#"]) {
        hex = [hex substringFromIndex:1];
    }
    
    NSScanner *colorScanner = [NSScanner scannerWithString:hex];
    unsigned int color;
    [colorScanner scanHexInt:&color];
    CGFloat r = ((color & 0xFF0000) >> 16)/255.0f;
    CGFloat g = ((color & 0x00FF00) >> 8) /255.0f;
    CGFloat b =  (color & 0x0000FF) /255.0f;
    //NSLog(@"HEX to RGB >> r:%f g:%f b:%f a:%f\n",r,g,b,a);
    return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
}


+ (UIColor *)colorFromThemeMode:(OTGThemeMode)themeMode
                      partsType:(OTGPartsType)partsType
{
    switch (themeMode) {
        case OTGThemeModeDark:
        {
            switch (partsType) {
                case OTGPartsTypeDateSeparator:
                {
                    return [self hexToUIColor:@"5d5d5d" alpha:1.0f];
                }
                case OTGPartsTypeDateAreaBackground:
                {
                    return [self hexToUIColor:@"3f3f3f" alpha:1.0f];
                }
                case OTGPartsTypePointAreaBackground:
                {
                    return [self hexToUIColor:@"3f3f3f" alpha:1.0f];
                }
                case OTGPartsTypeProcessAreaBackground:
                {
                    return [self hexToUIColor:@"383838" alpha:1.0f];
                }
                case OTGPartsTypeScrollBackground:
                {
                    return [self hexToUIColor:@"3f3f3f" alpha:1.0f];
                }
                case OTGPartsTypeTodayHighlitedBackground:
                {
                    return [self hexToUIColor:@"D07926" alpha:1.0f];
                }
                case OTGPartsTypeDotSeparator:
                {
                    return [self hexToUIColor:@"595959" alpha:1.0f];
                }
                case OTGPartsTypeChartBorder:
                {
                    return [self hexToUIColor:@"8b8b8b" alpha:1.0f];
                }
                case OTGPartsTypeDateText:
                {
                    return [UIColor whiteColor];
                }
                case OTGPartsTypeTodayHighlitedDateText:
                {
                    return [self hexToUIColor:@"3f3f3f" alpha:1.0f];
                }
                case OTGPartsTypeRowSeparator:
                {
                    return [self hexToUIColor:@"515151" alpha:1.0f];
                }
                case OTGPartsTypeRefreshArrowImage:
                {
                    return [self hexToUIColor:@"9c9c9c" alpha:1.0f];
                }
                case OTGPartsTypeTodayLineColor:
                {
                    return [self hexToUIColor:@"D07926" alpha:1.0f];
                }
            }
        }
        case OTGThemeModeBright:
        {
            switch (partsType) {
                case OTGPartsTypeDateSeparator:
                {
                    return [self hexToUIColor:@"E8E8E8" alpha:1.0f];
                }
                case OTGPartsTypeDateAreaBackground:
                {
                    return [self hexToUIColor:@"F4F7FC" alpha:1.0f];
                }
                case OTGPartsTypePointAreaBackground:
                {
                    return [UIColor whiteColor];
                }
                case OTGPartsTypeProcessAreaBackground:
                {
                    return [UIColor whiteColor];
                }
                case OTGPartsTypeScrollBackground:
                {
                    return [self hexToUIColor:@"F4F4F3" alpha:1.0f];
                }
                case OTGPartsTypeTodayHighlitedBackground:
                {
                    return [self hexToUIColor:@"F4F7FC" alpha:1.0f];
                }
                case OTGPartsTypeDotSeparator:
                {
                    return [UIColor clearColor];
                }
                case OTGPartsTypeChartBorder:
                {
                    return [self hexToUIColor:@"7C7C7C" alpha:1.0f];
                }
                case OTGPartsTypeDateText:
                {
                    return [self hexToUIColor:@"4f4f4f" alpha:1.0f];
                }
                case OTGPartsTypeTodayHighlitedDateText:
                {
                    return [self hexToUIColor:@"4f4f4f" alpha:1.0f];
                }
                case OTGPartsTypeRowSeparator:
                {
                    return [self hexToUIColor:@"C7C7C7" alpha:1.0f];
                }
                case OTGPartsTypeRefreshArrowImage:
                {
                    return [self hexToUIColor:@"9c9c9c" alpha:1.0f];
                }
                case OTGPartsTypeTodayLineColor:
                {
                    return [self hexToUIColor:@"fa9420" alpha:1.0f];
                }
            }
        }
        default:
        {
            return [UIColor blackColor];
        }
    }
}







#pragma mark - Found Index
/**
 リストから引数の日付が存在している場合indexを返す
 
 @param dateArray 日付リスト
 @param date 日付
 @return インデックス
 */
+ (NSInteger)foundSameDateIndexFromDateArray:(NSArray<NSDate *> *)dateArray
                                        date:(NSDate *)date
{
    dateArray = [self sortDateArray:dateArray];
    BOOL isContain = [self isContainDate:date startDate:[dateArray firstObject] lastDate:[dateArray lastObject]];
    
    if (!isContain) {
        return NSNotFound;
    }
    
    return [OTGCommonClass daysCountFromStartDate:[dateArray firstObject] lastDate:date isCountStartDate:NO];
}


/**
 リストから引数の日付が存在している場合indexを返す
 
 @param dateArray 日付リスト
 @param date 日付
 @return インデックス
 */
+ (NSInteger)foundSameDateIndexFromDateArrayByCompare:(NSArray<NSDate *> *)dateArray
                                                 date:(NSDate *)date
{
    dateArray = [self sortDateArray:dateArray];
    
    __block NSInteger index = NSNotFound;
    [dateArray enumerateObjectsUsingBlock:^(NSDate * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([self isEqualToDay1:date day2:obj] ) {
            index = idx;
            *stop = YES;
        }
    }];
    
    return index;
}


#pragma mark - Date

#pragma mark Contain Check
/**
 引数で渡された工程の期間が表示する期間に含まれるか判定する
 
 @param processStartDate 工程開始日
 @param processLastDate 工程終了日
 @param showStartDate 表示開始日
 @param showLastDate 表示終了日
 @return YES = どちらかが含まれる、 NO = どちらも範囲外
 */
+ (BOOL)isContainProcessStartDate:(NSDate *)processStartDate
                  processLastDate:(NSDate *)processLastDate
                    showStartDate:(NSDate *)showStartDate
                     showLastDate:(NSDate *)showLastDate
{
    if ([processStartDate compare:showStartDate] == NSOrderedAscending && [processLastDate compare:showStartDate] == NSOrderedDescending) {
        //工程開始日が表示開始日より前かつ、工程終了日が表示終了日より後の場合
        return YES;
    }
    
    BOOL isContainProcessStartDate = [self isContainDate:processStartDate
                                             startDate:showStartDate
                                              lastDate:showLastDate];
    
    BOOL isContainProcessLastDate = [self isContainDate:processLastDate
                                           startDate:showStartDate
                                            lastDate:showLastDate];
    
    if (isContainProcessStartDate || isContainProcessLastDate) {
        return YES;
    }
    
    return NO;
}
















@end
