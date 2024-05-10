//
//  AsyncButton.swift
//
//
//  Created by Nacho Soto on 12/11/23.
//

import Foundation
import SwiftUI

struct AsyncButton<Label>: View where Label: View {

    typealias Action = @Sendable @MainActor () async throws -> Void

    private let action: Action
    private let label: Label

    @State
    private var error: Error?

    init(
        action: @escaping Action,
        @ViewBuilder label: () -> Label
    ) {
        self.action = action
        self.label = label()
    }

    var body: some View {
        Button {
            Task {
                do {
                    try await self.action()
                } catch {
                    self.error = error
                }
            }
        } label: {
            self.label
        }
        .displayError(self.$error)
    }

}
