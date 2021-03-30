import UIKit

/*
 The chain of responsibility design pattern organizes request processors in a chain.
 The request gets propagated through the chain until it reaches the end of the chain
 */

protocol RequestHandling {
    init(next: RequestHandling?)
    
    func handle(request: Any)
}

final class Handler<T>: RequestHandling, CustomStringConvertible {
    
    public var description: String {
        return "\(T.self) Handler)"
    }
    
    
    
    // property
    private var nextHandler: RequestHandling?
    
    
    
    // Protocol
    init(next: RequestHandling?) {
        self.nextHandler = next
    }
    
    /*
    
     If the handler processes the request, we print a message to the console. Otherwise, we check if there’s a valid next handler in the chain. If nextHandler is nil, we print that we reached the end of the responder chain, and return.
     
     If nextHandler references a valid object, we print a log message telling that the current handler can’t handle the request, and we forward it to the next handler by calling its handle(request:) method.
     */
    
    func handle(request: Any) {
        if request is T {
            print("request processed by \(self)")
        } else {
            guard let handler = nextHandler else {
                print("Reached the end of the responder chain")
                return
            }
            print("\(self) can't handle \(type(of: request)) requests - forwarding to \(handler)")
            handler.handle(request: request)
        }
    }
}

let dataHandler = Handler<Data>(next: nil)
let stringHandler = Handler<String>(next: dataHandler)
let dateHandler = Handler<Date>(next: stringHandler)

let data = Data(repeating: 0, count: 10)
//dateHandler.handle(request: data)
dateHandler.handle(request: 42)
