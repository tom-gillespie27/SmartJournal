import SwiftUI

struct ContentView: View {
    @State private var entries: [JournalEntry] = JournalDataStore.shared.fetchEntries()
    @State private var showingDetail = false

    var body: some View {
        NavigationView {
            List(entries, id: \.id) { entry in
                NavigationLink(destination: EntryDetailView(entry: entry)) {
                    Text(entry.text)
                }
            }
            .navigationBarTitle("Entries")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingDetail = true
                }) {
                    Image(systemName: "plus")
                }
            )
        }
    }
}
