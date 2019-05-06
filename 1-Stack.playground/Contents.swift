//
//  1-Stack.playground
//
//
//  Created by Mehmet Tarhan on 6.05.2019.
//  Copyright © 2019 Mehmet Tarhan. All rights reserved.
//

import Foundation


// MARK: - STACK

/*

 What is a stack?
    It is literal a stack of something. For example a stack of books.
    A stack is LIFO(Last in First out) data structure. For instance navigation controller in iOS applies stack logic.
    You push a view controller into navigation controller and you pop it.
    An undo logic, a browser's history and Apple Music's -Play Next- are other examples of stacks
*/

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
