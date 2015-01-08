//
//  BITItem.h
//  RandomItems
//
//  Created by David Kerins on 2015-01-02.
//  Copyright (c) 2015 David Kerins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BITItem : NSObject
{
//    NSString *_itemName;
//    NSString *_serialNumber;
//    int _valueInDollars;
//    NSDate *_dataCreated;
//    
//    BITItem *_containedItem;
//    __weak BITItem *_container;
}

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;
@property (nonatomic, copy) NSString *itemKey;

+ (instancetype)randomItem;

// Designated initializer for BITItem
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;

- (instancetype)initWithItemName:(NSString *)name
                    serialNumber:(NSString *)sNumber;

// Getters and Setters

//- (void)setContainedItem:(BITItem *)item;
//- (BITItem *)containedItem;
//
//- (void)setContainer:(BITItem *)item;
//- (BITItem *)container;
//
//- (void)setItemName:(NSString *)str;
//- (NSString *)itemName;
//
//- (void)setSerialNumber:(NSString *)str;
//- (NSString *)serialNumber;
//
//- (void)setValueInDollars:(int)v;
//- (int)valueInDollars;
//
//- (NSDate *)dataCreated;

@end
