#!/bin/bash

TODO_FILE="todo.txt"

# Function to display the menu
display_menu() {
    echo "====================="
    echo "   To-Do List Menu   "
    echo "====================="
    echo "1. Add Task"
    echo "2. View Tasks"
    echo "3. Remove Task"
    echo "4. Exit"
    echo "====================="
}

# Function to add a task
add_task() {
    read -p "Enter the task: " task
    echo "$task" >> "$TODO_FILE"
    echo "Task added."
}

# Function to view tasks
view_tasks() {
    if [ ! -s "$TODO_FILE" ]; then
        echo "No tasks found."
    else
        echo "Tasks:"
        nl -w2 -s'. ' "$TODO_FILE"
    fi
}

# Function to remove a task
remove_task() {
    view_tasks
    read -p "Enter the task number to remove: " task_number
    sed -i.bak "${task_number}d" "$TODO_FILE" && echo "Task removed."
}

# Create the todo.txt file if it doesn't exist
touch "$TODO_FILE"

# Main loop
while true; do
    display_menu
    read -p "Choose an option (1-4): " option

    case $option in
        1) add_task ;;
        2) view_tasks ;;
        3) remove_task ;;
        4) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option. Please choose again." ;;
    esac
done

