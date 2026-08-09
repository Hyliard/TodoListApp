//
//  ToDoListView.swift
//  TodoListApp
//
//  Created by Luis Martinez on 26/05/2025.
//

import SwiftUI

struct ToDoListView: View {
    @State private var todos: [TodoItem] = []
    @State private var newTodoTitle: String = ""
    private var cleanTitle: String { newTodoTitle.trimmingCharacters(in: .whitespacesAndNewlines) }

    var body: some View {

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
                .disabled(cleanTitle.isEmpty)
            }

            // Lista de tareas
            if todos.isEmpty {
                VStack(spacing: 8) {
                    Image(systemName: "checklist")
                        .font(.system(size: 48))
                        .foregroundColor(.gray)
                    Text("No tienes tareas")
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text("Agrega una tarea para comenzar")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .multilineTextAlignment(.center)
            } else {
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

        }
        .background(Color("backgroundApp"))
        .navigationTitle("Lista de Tareas")

    }

    // Función para agregar una nueva tarea
    private func addTodo() {
        let title = cleanTitle
        guard !title.isEmpty else { return }
        let newTodo = TodoItem(title: title)
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

#Preview {
    ToDoListView()
}
