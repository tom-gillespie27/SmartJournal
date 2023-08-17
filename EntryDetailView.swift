import SwiftUI

struct EntryDetailView: View {
    @State var entry: JournalEntry

    var body: some View {
        VStack {
            Text(entry.date, style: .date)
            TextField("Enter text...", text: $entry.text)
        }
        .padding()
    }
}

extension EntryDetailView: Hashable, Equatable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(entry.date)
        hasher.combine(entry.text)
    }
    
    static func == (lhs: EntryDetailView, rhs: EntryDetailView) -> Bool {
        return lhs.entry == rhs.entry
    }
}
