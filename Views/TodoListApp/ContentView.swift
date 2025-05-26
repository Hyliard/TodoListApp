//
//  ContentView.swift
//  TodoListApp
//
//  Created by Hyliard on 18/11/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
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
                    List {
                        NavigationLink(destination: ToDoListView()) {
                            HStack {
                                Image(systemName: "checklist")
                                    .foregroundColor(.orange)
                                    .font(.title2)
                                    .frame(width: 30, alignment: .center)
                                Text("Lista de Tareas")
                                    .foregroundColor(.white)
                                    .font(.headline)
                            }
                            .padding(.vertical, 8)
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparatorTint(.white.opacity(0.3))
                        
/*                        NavigationLink(destination: CalendarView()) {
                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundColor(.green)
                                    .font(.title2)
                                    .frame(width: 30, alignment: .center)
                                Text("Calendario")
                                    .foregroundColor(.white)
                                    .font(.headline)
                            }
                            .padding(.vertical, 8)
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparatorTint(.white.opacity(0.3))
                        
                        NavigationLink(destination: NotesView()) {
                            HStack {
                                Image(systemName: "note.text")
                                    .foregroundColor(.blue)
                                    .font(.title2)
                                    .frame(width: 30, alignment: .center)
                                Text("Bloc de Notas")
                                    .foregroundColor(.white)
                                    .font(.headline)
                            }
                            .padding(.vertical, 8)
                        } */
                        .listRowBackground(Color.clear)
                        .listRowSeparatorTint(.white.opacity(0.3))
                    }
                    
                    .scrollContentBackground(.hidden) //con esto oculto el fondo blanco que viene por defecto
                    .listStyle(.plain)
                    .padding(.top, 20)
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
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
