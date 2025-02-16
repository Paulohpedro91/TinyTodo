#!/bin/bash

# Arquivo onde as tarefas serão armazenadas
TODO_FILE="todo_list.txt"

# Função para adicionar uma nova tarefa
add_todo() {
  echo "$1" >> "$TODO_FILE"
  echo "Tarefa '$1' adicionada."
}

# Função para listar todas as tarefas
list_todos() {
  if [ ! -f "$TODO_FILE" ] || [ ! -s "$TODO_FILE" ]; then
    echo "Nenhuma tarefa encontrada."
  else
    echo "Suas tarefas:"
    nl -s '. ' "$TODO_FILE"
  fi
}

# Função para remover uma tarefa
remove_todo() {
  if [ ! -f "$TODO_FILE" ] || [ ! -s "$TODO_FILE" ]; then
    echo "Nenhuma tarefa para remover."
  else
    sed -i "${1}d" "$TODO_FILE"
    echo "Tarefa número $1 removida."
  fi
}

# Exibição do menu de opções
show_menu() {
  clear
  echo "========================="
  echo "  MINHA LISTA DE TAREFAS  "
  echo "========================="
  echo "1. Adicionar tarefa"
  echo "2. Listar tarefas"
  echo "3. Remover tarefa"
  echo "4. Sair"
  echo "========================="
  echo -n "Escolha uma opção: "
}

# Loop principal do programa
while true; do
  show_menu
  read -r option

  case $option in
    1)
      echo -n "Digite a nova tarefa: "
      read -r task
      add_todo "$task"
      ;;
    2)
      list_todos
      ;;
    3)
      echo -n "Digite o número da tarefa a ser removida: "
      read -r num
      remove_todo "$num"
      ;;
    4)
      echo "Saindo..."
      break
      ;;
    *)
      echo "Opção inválida! Tente novamente."
      ;;
  esac

  echo -n "Pressione qualquer tecla para voltar ao menu..."
  read -r -n 1
done
