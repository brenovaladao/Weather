//
//  Sequence+Util.swift
//  Weather
//
//  Created by Breno Vinícios on 23/01/19.
//  Copyright © 2019 breno.vinicios. All rights reserved.
//

import Foundation

extension Sequence {
    
    func groupBy<G: Hashable>(closure: (Iterator.Element) -> G) -> [G: [Iterator.Element]] {
        var results = [G: [Iterator.Element]]()
        forEach {
            let key = closure($0)
            if var array = results[key] {
                array.append($0)
                results[key] = array
            } else {
                results[key] = [$0]
            }
        }
        return results
    }
}
