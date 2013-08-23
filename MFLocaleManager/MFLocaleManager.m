//
//  MFLocaleManager.m
//  MFLocalizedStrings
//
//  Created by Matteo Gavagnin on 24/06/13.
//  Copyright (c) 2013 MobFarm. All rights reserved.
//

#import "MFLocaleManager.h"
#define kMFSelectedLanguageKey  @"kLMSelectedLanguageKey"

@implementation MFLocaleManager

// Update this method with your specific supported languages.
+(BOOL) isSupportedLanguage:(NSString*)language {
    
    if ( [language isEqualToString:kMFEnglish] ) {
        return YES;
    }
    if ( [language isEqualToString:kMFItalian] ) {
        return YES;
    }
    if ( [language isEqualToString:kMFGerman] ) {
        return YES;
    }
    
    return NO;
}

+(NSString*) localizedString:(NSString*)key {
    NSString *selectedLanguage = [MFLocaleManager selectedLanguage];
    
    // Get the corresponding bundle path.
	NSString *path = [[NSBundle mainBundle] pathForResource:selectedLanguage ofType:@"lproj"];
    
    // Get the corresponding localized string.
    NSBundle* languageBundle = [NSBundle bundleWithPath:path];
	NSString* str = [languageBundle localizedStringForKey:key value:@"" table:nil];
    return str;
}

+(void) setSelectedLanguage:(NSString*)language {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    // Check if desired language is supported.
    if ( [self isSupportedLanguage:language] ) {
        [userDefaults setObject:language forKey:kMFSelectedLanguageKey];
    } else {
        // if desired language is not supported, set selected language to nil.
        [userDefaults setObject:nil forKey:kMFSelectedLanguageKey];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kMFlanguageDidChangeNotification object:nil userInfo:nil];
}

+(NSString*) selectedLanguage {
    // Get selected language from user defaults.
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *selectedLanguage = [userDefaults stringForKey:kMFSelectedLanguageKey];
    
    // if the language is not defined in user defaults yet...
    if (selectedLanguage == nil) {
        // Get the system language.
        NSArray* userLangs = [userDefaults objectForKey:@"AppleLanguages"];
        NSString *systemLanguage = [userLangs objectAtIndex:0];
        
        // if system language is supported by LanguageManager, set it as selected language.
        if ( [self isSupportedLanguage:systemLanguage] ) {
            [self setSelectedLanguage:systemLanguage];
            // if not...
        } else {
            // Set the LanguageManager default language as selected language.
            [self setSelectedLanguage:kMFDefaultLanguage];
        }
    }
    
    return [userDefaults stringForKey:kMFSelectedLanguageKey];
}

@end
