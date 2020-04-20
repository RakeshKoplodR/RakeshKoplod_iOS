//
//  TestUtils.swift
//  Rakesh_Koplod_iOSTests
//
//  Created by Rakesh on 20/04/20.
//  Copyright © 2020 Rakesh. All rights reserved.
//

import XCTest

class TestUtils: NSObject {
    func waitForException(timeout:TimeInterval) {
        let exp = XCTestExpectation(description: "Waiting")
        let result = XCTWaiter.wait(for: [exp], timeout: timeout)
        if result == XCTWaiter.Result.timedOut {
            XCTAssert(true)
        } else if result == XCTWaiter.Result.interrupted {
            XCTFail("Delay interrupted")
        }
    }
    
}
