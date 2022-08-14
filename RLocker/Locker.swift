//
//  Locker.swift
//  RLocker
//
//  Created by Guangyu Yang on 2022/8/14.
//

import Foundation
import XCGLogger

func lock() {
    logger.info("lock")
    
    let libHandle = dlopen("/System/Library/PrivateFrameworks/login.framework/Versions/Current/login", RTLD_LAZY)
    let sym = dlsym(libHandle, "SACLockScreenImmediate")
    typealias fn = @convention(c) () -> Void

    let SACLockScreenImmediate = unsafeBitCast(sym, to: fn.self)
    SACLockScreenImmediate()
    
    logger.debug("lock completed")
}
