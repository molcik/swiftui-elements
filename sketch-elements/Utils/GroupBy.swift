//
//  GroupBy.swift
//  sketch-elements
//
//  Created by Filip Krayem on 06.06.2021.
//  Copyright © 2021 Filip Molcik. All rights reserved.
//

import Foundation


/// This method returns a dictionary of values grouped by the value returned by a callback
///
///# Example #
/// ```
///  let albums = groupBy(photographyData, {$0.album})
///  // ["albumName1": [...], "albumName2: [...]]
/// ```
func groupBy<T, U>(_ array: [T], _ callback: (T) -> U) -> [U: [T]] {
    var grouped = [U: [T]]()
    for element in array {
        let key = callback(element)
        if var arr = grouped[key] {
            arr.append(element)
            grouped[key] = arr
        } else {
            grouped[key] = [element]
        }
    }
    return grouped
}
