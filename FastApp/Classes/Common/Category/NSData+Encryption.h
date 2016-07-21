//
//  NSData+Encryption.h
//  FreeShopping
//
//  Created by tangkunyin on 15/11/19.
//  Copyright © 2015年 www.freeshopping.com. All rights reserved.
//

#import <CommonCrypto/CommonCryptor.h>

@interface NSData(Encryption)

-(NSData*)AES256EncryptWithKey:(NSString*)key;
-(NSData*)AES256DecryptWithKey:(NSString*)key;

- (NSString *)newStringInBase64FromData;

@end
