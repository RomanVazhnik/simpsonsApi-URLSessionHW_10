//
//  Character .swift
//  simpsonsApi
//
//  Created by Роман Важник on 22/08/2019.
//  Copyright © 2019 Роман Важник. All rights reserved.
//

import Foundation

struct Character: Decodable {
    let quote: String
    let character: String
    let image: String
}
