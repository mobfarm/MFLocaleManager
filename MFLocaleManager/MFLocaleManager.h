// TODO: add link to https://github.com/albertodebortoli/ADBLanguageManager/blob/master/ADBLanguageManager.m
//
//  MFLocaleManager.h
//  MFLocalizedStrings
//
//  Created by Matteo Gavagnin on 24/06/13.
//  Copyright (c) 2013 MobFarm. All rights reserved.
//

#import <Foundation/Foundation.h>

// Supported languages.
// Add your specific supported languages here.
#define kMFDefaultLanguage  @"it"
#define kMFEnglish          @"en"
#define kMFItalian          @"it"
#define kMFGerman           @"de"

#define kMFlanguageDidChangeNotification @"MFLanguageDidChangeNotification"

@interface MFLocaleManager : NSObject
+(BOOL) isSupportedLanguage:(NSString*)language;
+(NSString*) localizedString:(NSString*) key;
+(void) setSelectedLanguage:(NSString*)language;
+(NSString*) selectedLanguage;


@end
