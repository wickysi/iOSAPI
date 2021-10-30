//
//  Never_Use.swift
//  iOSAPISwift
//
//  Created by user on 10/30/21.
//

import Foundation
import SwiftUI
import Combine

struct NeverUseView: View {
    
    let subject = PassthroughSubject<(), Never>()
    
    func crashAndBurn() -> Never {
        fatalError("Something very, very bad happened")
    }
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct NeverUseView_Previews: PreviewProvider {
    static var previews: some View {
        NeverUseView()
        
        
    }
}

class Clock {
    var timeString: String = "--:--:--" {
        didSet { print("\(timeString)") }
    }
}

