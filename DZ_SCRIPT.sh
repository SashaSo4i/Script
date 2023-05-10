#!/bin/bash

# Получение названий файлов ввода и вывода.
read -p "Введите название файла входных данных: " first_file
read -p "Введите название файла вывода: " last_file

# 2 проверки существуют ли файлы.
if [ ! -f "$first_file" ]; then
    echo "Входного файла нет."
    exit 1
fi

if [ ! -f "$last_file" ]; then
    echo "Файла вывода нет."
    exit 1
fi

# Запрос слова.
read -p "Введите искомое слово: " word

# Сам основной подсчет количества вхождений слова в файле ввода.
count=$(grep -d $'\n' -c "$word" "$first_file")
if [ $count -eq 0 ]; then
    echo "Искомое слово не найдено в файле"
    exit 1
else
    echo "Количество слов \"$word\" в файле: $count" >> "$last_file"
fi

echo "Готово."