//
//  CollectionTypeExtension.swift
//  SwiftExtensions
//
//  Created by Aryan on 9/26/15.
//  Copyright © 2015 aryaxt. All rights reserved.
//

extension CollectionType {
    
    /**
    Determines whether an object with a specified closure exists or not
    
    - parameter closure: A closure to describe the state of an element in collection
    
    - returns: A boolean that determines whether the state was found or not
    */
    func any(closure: Generator.Element -> Bool) -> Bool {
        for element in self {
            if closure(element) { return true }
        }
        
        return false
    }
    
    /**
    Determines whether all object follow a specified state or not
    
    - parameter closure: A closure to describe the state of an element in collection
    
    - returns: A boolean that determines whether the state was found on all opbjects or not
    */
    func all(closure: Generator.Element -> Bool) -> Bool {
        for element in self {
            if !closure(element) { return false }
        }
        
        return true
    }
    
    /**
    Groups a collection based on a given closure
    
    EX:  
    
    var groupedUsers = usersArray.groupBy { $0.age }
    
    usersArray.groupBy  => [User]
    groupedUsers        => [Int: [User]]
    
    - parameter closure: A closure that describes a key to be used to group objects
    
    - returns: a dictionary with key is as described by the closure, and the value is an array
    */
    func groupBy<T: Hashable>(closure: Generator.Element -> T) -> [T: [Generator.Element]] {
        var dict = Dictionary<T, [Generator.Element]>()
        
        for element in self {
            let key = closure(element)
            
            if let values = dict[key] {
                var newVal = values
                newVal.append(element)
                dict[key] = newVal
            }
            else {
                dict[key] = [element]
            }
        }
        
        return dict
    }
    
}
