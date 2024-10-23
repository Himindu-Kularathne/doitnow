import SwiftUI

struct ContentView: View {
    // Sample to-do list data
    let todoItems = ["Apple Watch app", "Amazing User Experience", "SwiftUI & watchOS"]

    @State private var noteText: String = ""

    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Spacer() // This pushes the rest of the content down
                // "Add new note" section with a plus button
                HStack {
                    TextField("Add new note", text: $noteText)
                        .foregroundColor(.gray)
                        .padding() // Add padding inside the TextField
                        .frame(width: 120)

                    

                    Button(action: {
                        print("Add new note tapped")
                    }) {
                        ZStack {
                            Circle()
                                .stroke(Color.yellow) // Draws the circle border

                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .padding()
                                .foregroundColor(.yellow) // Set icon color to yellow
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.vertical, 27)

                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        ForEach(todoItems, id: \.self) { item in
                            HStack {
                                Capsule()
                                    .fill(Color.yellow)
                                    .frame(width: 5, height: 20)

                                Text(item)
                                    .lineLimit(1) // Ensures long text is truncated
                                    .foregroundColor(.white)

                                Spacer()
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 5)
                            .background(Color.black.opacity(0.2)) // Background for each item
                            .cornerRadius(10)
                        }
                    }
                    .padding() // Add padding around the VStack
                }
            }

            // Top bar with "DOITKNOW" on the left and the current time on the right
            HStack {
                Text("DOITKNOW")
                    .font(.headline)
                    .foregroundColor(.yellow)

                

                // Display the current time on the right
                Text(Date(), style: .time)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .padding() // Add padding around the top bar
            .background(Color.black.opacity(0.8)) // Optional: background for the title bar
        }
        .edgesIgnoringSafeArea(.top) // Ignore safe area to allow title to stick to the top
    }
}

#Preview {
    ContentView()
}
