//
//  LetterView.swift
//  WordsPuzzleGame
//
//  Created by Maraj Hussain on 05/03/25.
//

import Foundation
import SwiftUI

struct LetterView: View {
    let letter: LetterModel
    var body: some View {
        Text(letter.letter)
            .font(.system(size: 16, weight: .semibold))
            .foregroundStyle(Color.white)
            .frame(width: 30, height: 30)
            .background(Color.white.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
