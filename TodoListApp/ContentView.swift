//
//  ContentView.swift
//  TodoListApp
//
//  Created by Hyliard on 18/11/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.1, green: 0.1, blue: 0.3),
                        Color(red: 0.3, green: 0.1, blue: 0.3)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom)
                .ignoresSafeArea()

                VStack {
                    ScrollView(showsIndicators: false) {
                        let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]
                        LazyVGrid(columns: columns, spacing: 16) {
                            // Lista de tareas (habilitada)
                            NavigationLink(destination: ToDoListView()) {
                                card(
                                    title: "Lista de Tareas",
                                    subtitle: "Organiza tu día",
                                    systemImage: "checklist",
                                    tint: .orange,
                                    isEnabled: true
                                )
                            }
                            .buttonStyle(.plain)

                            // Calendario (próximamente)
                            card(
                                title: "Calendario",
                                subtitle: "Próximamente",
                                systemImage: "calendar",
                                tint: .green,
                                isEnabled: false
                            )

                            // Notas (próximamente)
                            card(
                                title: "Notas",
                                subtitle: "Próximamente",
                                systemImage: "note.text",
                                tint: .blue,
                                isEnabled: false
                            )

                            // Recordatorios (próximamente)
                            card(
                                title: "Recordatorios",
                                subtitle: "Próximamente",
                                systemImage: "bell",
                                tint: .purple,
                                isEnabled: false
                            )
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 20)
                    }
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "house.fill")
                            .foregroundColor(.white)
                        Text("Productividad")
                            .font(.title3.weight(.bold))
                            .foregroundColor(.white)
                    }
                }
            }
            .toolbarBackground(
                LinearGradient(
                    colors: [Color(red: 0.2, green: 0.2, blue: 0.4), Color(red: 0.3, green: 0.1, blue: 0.3)],
                    startPoint: .leading,
                    endPoint: .trailing),
                for: .navigationBar)
        }
        .tint(.white)
    }

    private func card(title: String, subtitle: String, systemImage: String, tint: Color, isEnabled: Bool) -> some View {
        VStack(spacing: 8) {
            Image(systemName: systemImage)
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(tint)
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            Text(subtitle)
                .font(.footnote)
                .foregroundColor(Color.white.opacity(isEnabled ? 0.75 : 0.60))
        }
        .frame(maxWidth: .infinity)
        .frame(height: 120)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(.ultraThinMaterial)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .strokeBorder(.white.opacity(0.15), lineWidth: 1)
        )
        .opacity(isEnabled ? 1.0 : 0.8)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text("\(title). \(subtitle)"))
        .accessibilityHint(isEnabled ? Text("") : Text("Próximamente"))
        .accessibilityAddTraits(isEnabled ? .isButton : .isStaticText)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
