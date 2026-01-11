//
//  CounterViewModel.h
//  ObjectiveCMVVM
//
//  Created by Angelos Staboulis on 11/1/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CounterViewModel : NSObject
@property (nonatomic, copy) void (^onCountChanged)(NSString *countText);

- (void)increment;
- (NSString *)currentCountText;
@end

NS_ASSUME_NONNULL_END
