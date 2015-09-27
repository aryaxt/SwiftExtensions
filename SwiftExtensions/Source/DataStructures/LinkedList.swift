//
//  LinkedList.swift
//  SwiftExtensions
//
//  Created by Aryan on 9/26/15.
//  Copyright © 2015 aryaxt. All rights reserved.
//

public struct LinkedList<T> {
    
    private var head: LinkedListNode<T>?
    private var tail: LinkedListNode<T>?
    private var _count = 0
    public typealias Element = T
    public var count: Int { get { return _count } }
    
    public mutating func append(value: T) {
        let node = LinkedListNode<T>(value: value)
        _count++
        
        if var tail = tail {
            tail.next = node
            tail = node
        }
        else {
            head = node
            tail = node
        }
    }
    
    subscript (index: Int) -> T {
        get {
            var node = head
            for _ in 0..<index {
                node = node?.next
            }
            return node!.value
        }
    }
    
}

extension LinkedList: SequenceType {
    
    public typealias Generator = AnyGenerator<T>
    
    public func generate() -> AnyGenerator<T> {
        var node = head
        
        return anyGenerator {
            let current = node
            node = node?.next
            return current?.value
        }
    }
    
}

private class LinkedListNode<T>: CustomDebugStringConvertible {
    let value: T
    var next: LinkedListNode<T>?
    
    init(value: T) {
        self.value = value
    }
    
    var debugDescription: String {
        return "\(value)"
    }
}
