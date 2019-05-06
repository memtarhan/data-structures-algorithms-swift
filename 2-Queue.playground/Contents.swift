//
//  1-Queue.playground
//
//
//  Created by Mehmet Tarhan on 6.05.2019.
//  Copyright © 2019 Mehmet Tarhan. All rights reserved.
//

import UIKit


// MARK: - QUEUE

/*
 
 What is a queue?
    It is literal queue of something. For example a line of costumers in a bank.
    A queue is FIFO(First in First out) data structure. For example Spotify's -Add to Queue- applies queue logic.
*/

protocol Queue {
    associatedtype Element
    
    var isEmpty: Bool { get }
    var peek: Element? { get }
    
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
    
}

struct QueueArray<T>: Queue {
    private var storage: [T] = []
    
    var isEmpty: Bool {
        return storage.isEmpty
    }
    
    var peek: T? {
        return storage.first
    }
    
    mutating func enqueue(_ element: T) {
        storage.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        return isEmpty ? nil: storage.removeFirst()
    }
}


// MARK: - For printing content of a queue
extension QueueArray: CustomStringConvertible {
    var description: String {
        return
            storage
                .map { "\($0)"}
                .joined(separator: ", ")
    }
}


var queueArray = QueueArray<String>()

queueArray.enqueue("a")
queueArray.enqueue("b")
queueArray.enqueue("c")

print(queueArray.description)


struct QueueStack<T>: Queue {
    private var enqueueStack: [T] = []
    private var dequeueStack: [T] = []
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    var peek: T? {
        return !dequeueStack.isEmpty ? dequeueStack.last: enqueueStack.first
    }
    
    mutating func enqueue(_ element: T) {
        enqueueStack.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        
        return dequeueStack.popLast()
    }
}


var queueStack = QueueStack<Int>()

queueStack.enqueue(1)
queueStack.enqueue(2)
queueStack.enqueue(3)

print(queueStack.peek)

queueStack.dequeue()

print(queueStack.peek)
