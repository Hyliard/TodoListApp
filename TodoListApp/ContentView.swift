//
//  ContentView.swift
//  TodoListApp
//
//  Created by Hyliard on 18/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var todos: [TodoItem] = []
    @State private var newTodoTitle: String = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                // Campo de entrada para agregar nuevas tareas
                HStack {
                    TextField("Nueva tarea...", text: $newTodoTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button(action: {
                        addTodo()
                    }) {
                        Image(systemName: "plus.circle")
                            .font(.largeTitle)
                            .foregroundColor(Color("backgroundButton"))
                            .padding(.trailing)
                    }
                    .disabled(newTodoTitle.isEmpty)
                }
                
                // Lista de tareas
                List {
                    ForEach(todos) { todo in
                        HStack {
                            Button(action: {
                                toggleCompletion(for: todo)
                            }) {
                                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(todo.isCompleted ? .green : .gray)
                            }
                            
                            Text(todo.title)
                                .strikethrough(todo.isCompleted, color: .black)
                        }
                        
                    }
                    .onDelete(perform: deleteTodo)
                }
                .listStyle(InsetGroupedListStyle())
                
            }
            .background(Color("backgroundApp"))
            .navigationTitle("Lista de Tareas ")
            
        }
    }
    
    // Función para agregar una nueva tarea
    private func addTodo() {
        let newTodo = TodoItem(title: newTodoTitle)
        todos.append(newTodo)
        newTodoTitle = ""
    }
    
    // Función para marcar una tarea como completada
    private func toggleCompletion(for todo: TodoItem) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].isCompleted.toggle()
        }
    }
    
    // Función para eliminar una tarea
    private func deleteTodo(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
