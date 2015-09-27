//
//  LinkedListTests.swift
//  SwiftExtensions
//
//  Created by Aryan on 9/26/15.
//  Copyright © 2015 aryaxt. All rights reserved.
//

import XCTest
@testable import SwiftExtensions

class LinkedListTests: XCTestCase {
    
    func testAppend() {
        var list = LinkedList<Int>()
        list.append(0)
        list.append(1)
        list.append(2)
        
        for val in list {
            print(val)
        }
        XCTAssertTrue(list[0] == 0)
        XCTAssertTrue(list[1] == 1)
        XCTAssertTrue(list[2] == 2)
    }
    
}
