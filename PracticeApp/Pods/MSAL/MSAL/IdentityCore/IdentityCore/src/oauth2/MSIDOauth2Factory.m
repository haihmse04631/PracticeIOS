// Copyright (c) Microsoft Corporation.
// All rights reserved.
//
// This code is licensed under the MIT License.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files(the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and / or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions :
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "MSIDOauth2Factory.h"
#import "MSIDTokenResponse.h"
#import "MSIDRequestContext.h"
#import "MSIDAccessToken.h"
#import "MSIDBaseToken.h"
#import "MSIDRefreshToken.h"
#import "MSIDLegacySingleResourceToken.h"
#import "MSIDIdToken.h"
#import "MSIDAccount.h"
#import "MSIDWebviewConfiguration.h"
#import "MSIDLegacyAccessToken.h"
#import "MSIDLegacyRefreshToken.h"
#import "MSIDWebviewFactory.h"
#import "MSIDAccountIdentifier.h"

@implementation MSIDOauth2Factory

#pragma mark - Response

- (MSIDTokenResponse *)tokenResponseFromJSON:(NSDictionary *)json
                                     context:(id<MSIDRequestContext>)context
                                       error:(NSError **)error
{
    return [[MSIDTokenResponse alloc] initWithJSONDictionary:json error:error];
}

- (BOOL)verifyResponse:(MSIDTokenResponse *)response
               context:(id<MSIDRequestContext>)context
                 error:(NSError **)error
{
    if (!response)
    {
        if (error)
        {
            *error = MSIDCreateError(MSIDErrorDomain,
                                     MSIDErrorInternal, @"processTokenResponse called without a response dictionary", nil, nil, nil, context.correlationId, nil);
        }
        return NO;
    }
    
    if (response.error)
    {
        if (error)
        {
            *error = MSIDCreateError(MSIDOAuthErrorDomain,
                                     response.oauthErrorCode,
                                     response.errorDescription,
                                     response.error,
                                     nil,
                                     nil,
                                     context.correlationId,
                                     nil);
        }
        return NO;
    }
    
    if ([NSString msidIsStringNilOrBlank:response.accessToken])
    {
        if (error)
        {
            *error = MSIDCreateError(MSIDErrorDomain, MSIDErrorInternal, @"Authentication response received without expected accessToken", nil, nil, nil, context.correlationId, nil);
        }
        return NO;
    }
    
    return YES;
}

#pragma mark - Tokens

- (MSIDBaseToken *)baseTokenFromResponse:(MSIDTokenResponse *)response
                           configuration:(MSIDConfiguration *)configuration
{
    MSIDBaseToken *baseToken = [[MSIDBaseToken alloc] init];
    BOOL result = [self fillBaseToken:baseToken fromResponse:response configuration:configuration];

    if (!result) return nil;

    return baseToken;
}

- (MSIDAccessToken *)accessTokenFromResponse:(MSIDTokenResponse *)response
                               configuration:(MSIDConfiguration *)configuration
{
    MSIDAccessToken *accessToken = [[MSIDAccessToken alloc] init];
    BOOL result = [self fillAccessToken:accessToken fromResponse:response configuration:configuration];

    if (!result) return nil;
    return accessToken;
}

- (MSIDLegacyAccessToken *)legacyAccessTokenFromResponse:(MSIDTokenResponse *)response
                                           configuration:(MSIDConfiguration *)configuration
{
    MSIDLegacyAccessToken *accessToken = [[MSIDLegacyAccessToken alloc] init];
    BOOL result = [self fillLegacyAccessToken:accessToken fromResponse:response configuration:configuration];

    if (!result) return nil;
    return accessToken;
}

- (MSIDLegacyRefreshToken *)legacyRefreshTokenFromResponse:(MSIDTokenResponse *)response
                                             configuration:(MSIDConfiguration *)configuration
{
    MSIDLegacyRefreshToken *refreshToken = [[MSIDLegacyRefreshToken alloc] init];
    BOOL result = [self fillLegacyRefreshToken:refreshToken fromResponse:response configuration:configuration];

    if (!result) return nil;
    return refreshToken;
}

- (MSIDRefreshToken *)refreshTokenFromResponse:(MSIDTokenResponse *)response
                                 configuration:(MSIDConfiguration *)configuration
{
    MSIDRefreshToken *refreshToken = [[MSIDRefreshToken alloc] init];
    BOOL result = [self fillRefreshToken:refreshToken fromResponse:response configuration:configuration];

    if (!result) return nil;
    return refreshToken;
}

- (MSIDIdToken *)idTokenFromResponse:(MSIDTokenResponse *)response
                       configuration:(MSIDConfiguration *)configuration
{
    MSIDIdToken *idToken = [[MSIDIdToken alloc] init];
    BOOL result = [self fillIDToken:idToken fromResponse:response configuration:configuration];

    if (!result) return nil;
    return idToken;
}

- (MSIDLegacySingleResourceToken *)legacyTokenFromResponse:(MSIDTokenResponse *)response
                                             configuration:(MSIDConfiguration *)configuration
{
    MSIDLegacySingleResourceToken *legacyToken = [[MSIDLegacySingleResourceToken alloc] init];
    BOOL result = [self fillLegacyToken:legacyToken fromResponse:response configuration:configuration];

    if (!result) return nil;
    return legacyToken;
}

- (MSIDAccount *)accountFromResponse:(MSIDTokenResponse *)response configuration:(MSIDConfiguration *)configuration
{
    MSIDAccount *account = [[MSIDAccount alloc] init];
    BOOL result = [self fillAccount:account fromResponse:response configuration:configuration];

    if (!result) return nil;
    return account;
}

#pragma mark - Token helpers

- (BOOL)fillBaseToken:(MSIDBaseToken *)token
         fromResponse:(MSIDTokenResponse *)response
        configuration:(MSIDConfiguration *)configuration
{
    if (!response
        || !configuration)
    {
        return NO;
    }
    
    token.authority = configuration.authority;
    token.clientId = configuration.clientId;
    token.additionalServerInfo = response.additionalServerInfo;
    token.accountIdentifier = [[MSIDAccountIdentifier alloc] initWithLegacyAccountId:response.idTokenObj.userId
                                                                       homeAccountId:response.idTokenObj.userId];
    return YES;
}

- (BOOL)fillAccessToken:(MSIDAccessToken *)token
           fromResponse:(MSIDTokenResponse *)response
          configuration:(MSIDConfiguration *)configuration
{
    BOOL result = [self fillBaseToken:token fromResponse:response configuration:configuration];

    if (!result)
    {
        return NO;
    }
    
    token.scopes = [response.target scopeSet];
    token.accessToken = response.accessToken;
    
    if (!token.accessToken)
    {
        MSID_LOG_ERROR(nil, @"Trying to initialize access token when missing access token field");
        return NO;
    }
    NSDate *expiresOn = response.expiryDate;
    
    if (!expiresOn)
    {
        MSID_LOG_WARN(nil, @"The server did not return the expiration time for the access token.");
        expiresOn = [NSDate dateWithTimeIntervalSinceNow:3600.0]; //Assume 1hr expiration
    }
    
    token.expiresOn = [NSDate dateWithTimeIntervalSince1970:(uint64_t)[expiresOn timeIntervalSince1970]];
    token.cachedAt = [NSDate dateWithTimeIntervalSince1970:(uint64_t)[[NSDate date] timeIntervalSince1970]];

    return YES;
}

- (BOOL)fillRefreshToken:(MSIDRefreshToken *)token
            fromResponse:(MSIDTokenResponse *)response
           configuration:(MSIDConfiguration *)configuration
{
    BOOL result = [self fillBaseToken:token fromResponse:response configuration:configuration];

    if (!result)
    {
        return NO;
    }
    
    if (!response.isMultiResource)
    {
        return NO;
    }
    
    token.refreshToken = response.refreshToken;
    
    if (!token.refreshToken)
    {
        MSID_LOG_ERROR(nil, @"Trying to initialize refresh token when missing refresh token field");
        return NO;
    }

    return YES;
}

- (BOOL)fillIDToken:(MSIDIdToken *)token
       fromResponse:(MSIDTokenResponse *)response
      configuration:(MSIDConfiguration *)configuration
{
    BOOL result = [self fillBaseToken:token fromResponse:response configuration:configuration];

    if (!result)
    {
        return NO;
    }
    
    token.rawIdToken = response.idToken;
    
    if (!token.rawIdToken)
    {
        MSID_LOG_ERROR(nil, @"Trying to initialize ID token when missing ID token field");
        return NO;
    }

    return YES;
}

- (BOOL)fillLegacyToken:(MSIDLegacySingleResourceToken *)token
           fromResponse:(MSIDTokenResponse *)response
          configuration:(MSIDConfiguration *)configuration
{
    BOOL result = [self fillAccessToken:token fromResponse:response configuration:configuration];

    if (!result)
    {
        return NO;
    }
    
    token.refreshToken = response.refreshToken;
    token.idToken = response.idToken;
    token.accountIdentifier = [[MSIDAccountIdentifier alloc] initWithLegacyAccountId:response.idTokenObj.userId homeAccountId:token.accountIdentifier.homeAccountId];
    token.accessTokenType = response.tokenType ? response.tokenType : MSID_OAUTH2_BEARER;
    return YES;
}

- (BOOL)fillLegacyAccessToken:(MSIDLegacyAccessToken *)token
                 fromResponse:(MSIDTokenResponse *)response
                configuration:(MSIDConfiguration *)configuration
{
    BOOL result = [self fillAccessToken:token fromResponse:response configuration:configuration];

    if (!result)
    {
        return NO;
    }

    token.idToken = response.idToken;
    token.accountIdentifier = [[MSIDAccountIdentifier alloc] initWithLegacyAccountId:response.idTokenObj.userId homeAccountId:token.accountIdentifier.homeAccountId];
    token.accessTokenType = response.tokenType ? response.tokenType : MSID_OAUTH2_BEARER;
    return YES;
}

- (BOOL)fillLegacyRefreshToken:(MSIDLegacyRefreshToken *)token
                  fromResponse:(MSIDTokenResponse *)response
                 configuration:(MSIDConfiguration *)configuration
{
    BOOL result = [self fillRefreshToken:token fromResponse:response configuration:configuration];

    if (!result)
    {
        return NO;
    }

    token.idToken = response.idToken;
    token.accountIdentifier = [[MSIDAccountIdentifier alloc] initWithLegacyAccountId:response.idTokenObj.userId homeAccountId:token.accountIdentifier.homeAccountId];
    token.realm = response.idTokenObj.realm;
    return YES;
}

- (BOOL)fillAccount:(MSIDAccount *)account
       fromResponse:(MSIDTokenResponse *)response
      configuration:(MSIDConfiguration *)configuration
{
    NSString *homeAccountId = response.idTokenObj.userId;

    if (!homeAccountId)
    {
        return NO;
    }

    account.accountIdentifier = [[MSIDAccountIdentifier alloc] initWithLegacyAccountId:response.idTokenObj.username homeAccountId:homeAccountId];
    account.username = response.idTokenObj.username;
    account.givenName = response.idTokenObj.givenName;
    account.familyName = response.idTokenObj.familyName;
    account.middleName = response.idTokenObj.middleName;
    account.name = response.idTokenObj.name;
    account.authority = configuration.authority;
    account.accountType = response.accountType;
    account.localAccountId = response.idTokenObj.uniqueId;
    return YES;
}

- (NSURL *)cacheURLForAuthority:(NSURL *)originalAuthority
                        context:(id<MSIDRequestContext>)context
{
    return originalAuthority;
}

- (NSString *)cacheEnvironmentFromEnvironment:(NSString *)originalEnvironment context:(id<MSIDRequestContext>)context
{
    return originalEnvironment;
}

- (NSArray<NSURL *> *)legacyAccessTokenLookupAuthorities:(NSURL *)originalAuthority
{
    if (!originalAuthority)
    {
        return @[];
    }

    return @[originalAuthority];
}

- (NSArray<NSURL *> *)legacyRefreshTokenLookupAuthorities:(NSURL *)originalAuthority
{
    if (!originalAuthority)
    {
        return @[];
    }

    return @[originalAuthority];
}

- (NSArray<NSString *> *)defaultCacheAliasesForEnvironment:(NSString *)originalEnvironment
{
    if (!originalEnvironment)
    {
        return @[];
    }

    return @[originalEnvironment];
}

#pragma mark - Webview
#pragma mark - Webview
- (MSIDWebviewFactory *)webviewFactory
{
    if (!_webviewFactory)
    {
        _webviewFactory = [MSIDWebviewFactory new];
    }
    return _webviewFactory;
}

@end
