import UIKit

class Node<T> {
    var key: T?
    var next: Node?
    
    init(_ value: T? = nil) {
        key = value
    }
}
