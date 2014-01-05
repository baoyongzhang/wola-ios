
//
//  TMContactEngine.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-27.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMContactEngine.h"
#import <AddressBook/AddressBook.h>
#import "TMContact.h"

@implementation TMContactEngine

+ (NSMutableArray *) queryAllContact
{
    ABAddressBookRef addressBook = nil;
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0)
    {
        addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
        
        //等待同意后向下执行
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error)
                                                 {
                                                     dispatch_semaphore_signal(sema);
                                                 });
        
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        dispatch_release(sema); 
    } 
    else 
    { 
        addressBook = ABAddressBookCreate(); 
    } 
    
    NSArray *contacts = (NSArray *)CFBridgingRelease(ABAddressBookCopyArrayOfAllPeople(addressBook));
    
    NSMutableArray *_allContacts = [NSMutableArray array];
    
    
    int contactsCount = [contacts count];
    
    for(int i = 0; i < contactsCount; i++)
    {
        ABRecordRef record = (ABRecordRef)CFBridgingRetain([contacts objectAtIndex:i]);
        TMContact * contact = [[TMContact alloc] init];
        //取得姓名
        CFStringRef  firstNameRef =  ABRecordCopyValue(record, kABPersonFirstNameProperty);
        contact.firstName = (NSString *)CFBridgingRelease(firstNameRef);
        CFStringRef lastNameRef = ABRecordCopyValue(record, kABPersonLastNameProperty);
        contact.lastName = (NSString *)CFBridgingRelease(lastNameRef);
        CFStringRef compositeNameRef = ABRecordCopyCompositeName(record);
        contact.compositeName = (NSString *)CFBridgingRelease(compositeNameRef);
        
        firstNameRef != NULL ? CFRelease(firstNameRef) : NULL;
        lastNameRef != NULL ? CFRelease(lastNameRef) : NULL;
        compositeNameRef != NULL ? CFRelease(compositeNameRef) : NULL;
        
        //取得联系人的ID
        contact.recordID = (int)ABRecordGetRecordID(record);
        
        
        
        //联系人头像
        if(ABPersonHasImageData(record))
        {
            //            NSData * imageData = ( NSData *)ABPersonCopyImageData(record);
            NSData * imageData = (NSData *)CFBridgingRelease(ABPersonCopyImageDataWithFormat(record,kABPersonImageFormatThumbnail));
            UIImage * image = [[UIImage alloc] initWithData:imageData];

            contact.image = image;
        }
        
        
        //处理联系人电话号码
        ABMultiValueRef  phones = ABRecordCopyValue(record, kABPersonPhoneProperty);
        for(int i = 0; i < ABMultiValueGetCount(phones); i++)
        {
            
            CFStringRef phoneLabelRef = ABMultiValueCopyLabelAtIndex(phones, i);
            CFStringRef localizedPhoneLabelRef = ABAddressBookCopyLocalizedLabel(phoneLabelRef);
            CFStringRef phoneNumberRef = ABMultiValueCopyValueAtIndex(phones, i);
            
            NSString * localizedPhoneLabel = (NSString *) CFBridgingRelease(localizedPhoneLabelRef);
            NSString * phoneNumber = (NSString *)CFBridgingRelease(phoneNumberRef);
            
            [contact.phoneInfo setValue:phoneNumber forKey:localizedPhoneLabel];
            
            //释放内存
            phoneLabelRef == NULL ? : CFRelease(phoneLabelRef);
            localizedPhoneLabelRef == NULL ? : CFRelease(localizedPhoneLabelRef);
            phoneNumberRef == NULL ? : CFRelease(phoneNumberRef);
            
        }
        if(phones != NULL) CFRelease(phones);
        
        //处理联系人邮箱
        ABMultiValueRef emails = ABRecordCopyValue(record, kABPersonEmailProperty);
        for(int i = 0; i < ABMultiValueGetCount(emails); i++)
        {
            
            CFStringRef emailLabelRef = ABMultiValueCopyLabelAtIndex(emails, i);
            CFStringRef localizedEmailLabelRef = ABAddressBookCopyLocalizedLabel(emailLabelRef);
            CFStringRef emailRef = ABMultiValueCopyValueAtIndex(emails, i);
            
            NSString * localizedEmailLabel = ( NSString *)CFBridgingRelease(localizedEmailLabelRef);
            
            NSString * email = (NSString *)CFBridgingRelease(emailRef);
            
            [contact.emailInfo setValue:email forKey:localizedEmailLabel];
            
            emailLabelRef == NULL ? : CFRelease(emailLabelRef);
            localizedEmailLabel == NULL ? : CFRelease(localizedEmailLabelRef);
            emailRef == NULL ? : CFRelease(emailRef);
            
        }
        if(emails != NULL) CFRelease(emails);
        
        
        [_allContacts addObject:contact];
        CFRelease(record);
        
    }
    return _allContacts;
}

@end
