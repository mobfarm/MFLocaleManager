//
//  MFLocalizedLabel.h
//  MFLocalizedStrings
//
//  Created by Matteo Gavagnin on 24/06/13.
//  Copyright (c) 2013 MobFarm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFLocalizedLabel : UILabel

@property (nonatomic) NSString *localizedIdentifier;

- (void)loadLocalizedText;

@end
