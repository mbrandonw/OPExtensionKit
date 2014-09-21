//
//  OPHTTPStatusCodes.h
//  OPApplicationKit
//
//  Created by Brandon Williams on 3/28/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const struct OPHTTPStatusCodes {

  // 1XX Informational
  NSRange informationals;
  NSUInteger continue_;
  NSUInteger switchingProtocols;
  NSUInteger processing;

  // 2XX Success
  NSRange successes;
  NSUInteger ok;
  NSUInteger created;
  NSUInteger accepted;
  NSUInteger nonAuthoritativeInformation;
  NSUInteger noContent;
  NSUInteger resetContent;
  NSUInteger partialContent;
  NSUInteger multiStatus;

  // 3XX Redirection
  NSRange redirections;
  NSUInteger multipleChoices;
  NSUInteger movedPermanently;
  NSUInteger found;
  NSUInteger seeOther;
  NSUInteger notModified;
  NSUInteger useProxy;
  NSUInteger temporaryRedirect;

  // 4XX Client Error
  NSRange clientErrors;
  NSUInteger badRequest;
  NSUInteger unauthorized;
  NSUInteger paymentRequired;
  NSUInteger forbidden;
  NSUInteger notFound;
  NSUInteger methodNotAllowed;
  NSUInteger notAcceptable;
  NSUInteger proxyAuthenticationRequired;
  NSUInteger requestTimeout;
  NSUInteger conflict;
  NSUInteger gone;
  NSUInteger lengthRequired;
  NSUInteger preconditionFailed;
  NSUInteger requestEntityTooLarge;
  NSUInteger requestUriTooLong;
  NSUInteger unsupportedMediaType;
  NSUInteger requestedRangeNotSatisfiable;
  NSUInteger expectationFailed;
  NSUInteger unprocessableEntity;
  NSUInteger locked;
  NSUInteger failedDependency;
  NSUInteger upgradeRequired;

  // 5XX Server Error
  NSRange serverErrors;
  NSUInteger internalServerError;
  NSUInteger notImplemented;
  NSUInteger badGateway;
  NSUInteger serviceUnavailable;
  NSUInteger gatewayTimeout;
  NSUInteger httpVersionNotSupported;
  NSUInteger insufficientStorage;
  NSUInteger notExtended;

} OPHTTPStatusCodes;
