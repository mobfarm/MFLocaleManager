//
//  MFLocalizedLabel.m
//  MFLocalizedStrings
//
//  Created by Matteo Gavagnin on 24/06/13.
//  Copyright (c) 2013 MobFarm. All rights reserved.
//

#import "MFLocalizedLabel.h"
#import "MFLocaleManager.h"

@implementation MFLocalizedLabel

- (void)setLocalizedIdentifier:(NSString *)localizedIdentifier{
    // TODO: check if we are already registered
    _localizedIdentifier = localizedIdentifier;
    if (localizedIdentifier && ![localizedIdentifier isEqualToString:@""]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTextAfterLanguageChange:) name:kMFlanguageDidChangeNotification object:nil];
    }
}

- (void)updateTextAfterLanguageChange:(NSNotification *)notification{
    if (self.localizedIdentifier) {
        self.text = [MFLocaleManager localizedString:self.localizedIdentifier];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kMFlanguageDidChangeNotification object:nil];
}

- (void)loadLocalizedText{
    [self updateTextAfterLanguageChange:nil];
}


@end
