//
//  UnsignedIntegerType+Extension.swift
//  SwiftExtensions
//
//  Created by Aryan on 9/26/15.
//  Copyright © 2015 aryaxt. All rights reserved.
//

public extension UnsignedIntegerType {
    
    /**
    Executes a closure based on the given number, and passes index as a parameter to the closure
    
    Ex:
    5.times { print "Time: \($0)" }
    
    - parameter closure: closure to be executed
    */
    public func times(closure: (Self)->()) {
        for i in 0..<self { closure(i) }
    }
    
    /**
    Executes a closure based on the given number
    
    Ex:
    5.times(print("hello"))
    5.times { print("hello") }
    
    - parameter closure: closure to be executed
    */
    public func times(@autoclosure closure: ()->()) {
        for _ in 0..<self { closure() }
    }
    
}
