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
                HStack {
                    TextField(
                        "",
                        text: $newTodoTitle,
                        prompt: Text("Nueva tarea...")
                            .foregroundColor(Color.white.opacity(0.6))
                    )
                    .foregroundColor(.white)
                    .textInputAutocapitalization(.sentences)
                    .disableAutocorrection(false)

                    Button(action: { addTodo() }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 28, weight: .semibold))
                            .foregroundColor(.orange)
                    }
                    .accessibilityLabel("Agregar tarea")
                    .disabled(cleanTitle.isEmpty)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.ultraThinMaterial)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .strokeBorder(.white.opacity(0.15), lineWidth: 1)
                )
                .padding(.horizontal, 16)

                if todos.isEmpty {
                    VStack(spacing: 8) {
                        Image(systemName: "checklist")
                            .font(.system(size: 48))
                            .foregroundColor(Color.white.opacity(0.7))
                        Text("No tienes tareas")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("Agrega una tarea para comenzar")
                            .font(.subheadline)
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .multilineTextAlignment(.center)
                } else {
                    List {
                        ForEach(todos) { todo in
                            HStack(spacing: 12) {
                                Button(action: {
                                    toggleCompletion(for: todo)
                                }) {
                                    Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(todo.isCompleted ? .green : Color.white.opacity(0.8))
                                        .font(.system(size: 22, weight: .semibold))
                                }
                                .accessibilityLabel(todo.isCompleted ? "Marcar como pendiente" : "Marcar como completada")

                                Text(todo.title)
                                    .foregroundColor(.white)
                                    .strikethrough(todo.isCompleted, color: .white)
                                    .opacity(todo.isCompleted ? 0.7 : 1.0)
                            }
                            .padding(12)
                            .background(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .fill(.ultraThinMaterial)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .strokeBorder(.white.opacity(0.15), lineWidth: 1)
                            )
                            .listRowBackground(Color.clear)
                        }
                        .onDelete(perform: deleteTodo)
                    }
                    .scrollContentBackground(.hidden)
                    .listStyle(.plain)
                    .listRowSeparator(.hidden)
                }

            }
            .navigationTitle("Lista de Tareas")
        }
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
