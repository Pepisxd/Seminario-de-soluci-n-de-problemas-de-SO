#!/bin/bash

# Función para mostrar el menú
mostrar_menu() {
    echo "Selecciona una opción:"
    echo "1. Listar contenido de un fichero (carpeta)"
    echo "2. Crear un archivo de texto con una línea de texto"
    echo "3. Comparar dos archivos de texto"
    echo "4. Mostrar uso del comando awk"
    echo "5. Mostrar uso del comando grep"
    echo "6. Salir"
}

# Función para listar el contenido de una carpeta
listar_contenido() {
    read -p "Introduce la ruta absoluta de la carpeta: " ruta
    if [ -d "$ruta" ]; then
        ls -l "$ruta"
    else
        echo "La ruta no es válida o no es una carpeta."
    fi
}

# Función para crear un archivo de texto
crear_archivo() {
    read -p "Introduce el nombre del archivo a crear: " archivo
    read -p "Introduce la línea de texto para almacenar: " texto
    echo "$texto" > "$archivo"
    echo "Archivo $archivo creado con éxito."
}

# Función para comparar dos archivos de texto
comparar_archivos() {
    read -p "Introduce la ruta del primer archivo: " archivo1
    read -p "Introduce la ruta del segundo archivo: " archivo2
    if [ -f "$archivo1" ] && [ -f "$archivo2" ]; then
        diff "$archivo1" "$archivo2"
    else
        echo "Uno o ambos archivos no existen."
    fi
}

# Función para mostrar uso del comando awk
mostrar_uso_awk() {
    read -p "Introduce la ruta de un archivo de texto para analizar con awk: " archivo
    if [ -f "$archivo" ]; then
        echo "Mostrando la primera columna de cada línea en el archivo:"
        awk '{print $1}' "$archivo"
    else
        echo "El archivo no existe."
    fi
}

# Función para mostrar uso del comando grep
mostrar_uso_grep() {
    read -p "Introduce la palabra a buscar: " palabra
    read -p "Introduce la ruta de un archivo de texto: " archivo
    if [ -f "$archivo" ]; then
        echo "Mostrando líneas que contienen la palabra '$palabra':"
        grep "$palabra" "$archivo"
    else
        echo "El archivo no existe."
    fi
}

# Bucle para mostrar el menú hasta que el usuario elija salir
while true; do
    mostrar_menu
    read -p "Introduce una opción: " opcion

    case $opcion in
        1)
            listar_contenido
            ;;
        2)
            crear_archivo
            ;;
        3)
            comparar_archivos
            ;;
        4)
            mostrar_uso_awk
            ;;
        5)
            mostrar_uso_grep
            ;;
        6)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción no válida."
            ;;
    esac
    echo "" # Línea en blanco para separar las salidas
done
