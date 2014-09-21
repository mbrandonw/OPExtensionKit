//
//  OPHTTPStatusCodes.m
//  OPApplicationKit
//
//  Created by Brandon Williams on 3/28/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "OPHTTPStatusCodes.h"

const struct OPHTTPStatusCodes OPHTTPStatusCodes = {

    // 1XX Informational
    .informationals = (NSRange){100,100},
    .continue_ = 100,
    .switchingProtocols = 101,
    .processing = 102,

    // 2XX Success
    .successes = (NSRange){200,100},
    .ok = 200,
    .created = 201,
    .accepted = 202,
    .nonAuthoritativeInformation = 203,
    .noContent = 204,
    .resetContent = 205,
    .partialContent = 206,
    .multiStatus = 207,

    // 3XX Redirection
    .redirections = (NSRange){300,100},
    .multipleChoices = 300,
    .movedPermanently = 301,
    .found = 302,
    .seeOther = 303,
    .notModified = 304,
    .useProxy = 305,
    .temporaryRedirect = 307,

    // 4XX Client Error
    .clientErrors = (NSRange){400,100},
    .badRequest = 400,
    .unauthorized = 401,
    .paymentRequired = 402,
    .forbidden = 403,
    .notFound = 404,
    .methodNotAllowed = 405,
    .notAcceptable = 406,
    .proxyAuthenticationRequired = 407,
    .requestTimeout = 408,
    .conflict = 409,
    .gone = 410,
    .lengthRequired = 411,
    .preconditionFailed = 412,
    .requestEntityTooLarge = 413,
    .requestUriTooLong = 414,
    .unsupportedMediaType = 415,
    .requestedRangeNotSatisfiable = 416,
    .expectationFailed = 417,
    .unprocessableEntity = 422,
    .locked = 423,
    .failedDependency = 424,
    .upgradeRequired = 426,

    // 5XX Server Error
    .serverErrors = (NSRange){500,100},
    .internalServerError = 500,
    .notImplemented = 501,
    .badGateway = 502,
    .serviceUnavailable = 503,
    .gatewayTimeout = 504,
    .httpVersionNotSupported = 505,
    .insufficientStorage = 507,
    .notExtended = 510,
};
