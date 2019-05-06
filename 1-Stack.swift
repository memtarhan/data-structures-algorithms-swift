//
//  1-Stack.swift
//  
//
//  Created by Mehmet Tarhan on 6.05.2019.
//  Copyright © 2019 Mehmet Tarhan. All rights reserved.
//

import Foundation

struct Stack<Element: Equatable>: Equatable {
    
    private var storage: [Element] = []
    
    var isEmpty: Bool {
        return peek() == nil
    }
    
    init() { }
    
    init(_ elements: [Element]) {
        storage = elements
    }
    
    // Pushing operations
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    // Popping operations
    @discardableResult
    mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    // Peeking operations
    func peek() -> Element? {
        return storage.last
    }
}

// MARK: - For printing content of a stack
extension Stack: CustomStringConvertible {
    var description: String {
        return
            storage
                .map { "\($0)"}
                .joined(separator: ", ")
    }
}

// MARK: - For using array literal -> Creating a stack with []
extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        storage = elements
    }
}

var stack = Stack<String>()

// Pushing elements
stack.push("a")
stack.push("b")
stack.push("c")

print(stack.description)

// Popping elements
stack.pop()

print(stack.description)

// Peeking elements
print(stack.peek())

// Checking if empty
print("Is stack empty? -> \(stack.isEmpty)")

// With array literal

let newStack: Stack = [1, 2, 3]
print(newStack.description)
