#!/bin/bash
echo '--------------------------------'
echo 'SERENITY + SCREENPLAY - GENERATE'
echo 'Autor: Luis Angel Vanegas Martinez'
echo 'Versión: 1.0.0'
echo ' '

# Arquetipo
echo '# Arquetipo'
echo 'Ingresa el nombre del  Proyecto'
read NAME_PROJECT
./src/arquetipo/folders.generate.sh $NAME_PROJECT
./src/arquetipo/files.generate.sh $NAME_PROJECT
echo '        - Arquetipo, OK!'
echo ' '

echo 'Desea agregar elementos (y/n)?'
read _CONDICION
echo ' '

while [ $_CONDICION = y ]
do
# Menu 
echo '# Menú de Elementos'
echo '¿Que deseas Agregar?  |task-ui-initial|model|question|task|userinterface|util|'
read SELECCION
echo ' '
case $SELECCION in
  model)
    echo 'Ingresa el nombre del  Model [CategoryModel]'
    read NAME_MODEL
    ./src/model.generate.sh $NAME_PROJECT $NAME_MODEL
    echo '        - Model, OK!'
    echo ' '
  ;;
  question)
    echo 'Ingresa el nombre del  Question [TheCategory]'
    read NAME_QUESTION
    echo 'Ingresa el nombre de la UserInterface para Question '
    read NAME_USERINTERFACE
    ./src/question.generate.sh $NAME_PROJECT $NAME_QUESTION $NAME_USERINTERFACE
    echo '        - Question, OK!'
    echo ' '
  ;;
  task)
    echo 'Ingresa el nombre del  Task [Search]'
    read NAME_TASK
    echo 'Ingresa el nombre de la UserInterface para Task '
    read NAME_USERINTERFACE
    ./src/task.generate.sh $NAME_PROJECT $NAME_TASK $NAME_USERINTERFACE
    echo '        - Task, OK!'
    echo ' '
  ;;
  userinterface)
    echo 'Ingresa el nombre del  UserInterface [Dashboard]'
    read NAME_USERINTERFACE
    ./src/userinterface.generate.sh $NAME_PROJECT $NAME_USERINTERFACE
    echo '        - UserInterface, OK!'
    echo ' '
  ;;
  util)
    echo 'Ingresa el nombre del  Util [Constans]'
    read NAME_UTIL
    ./src/util.generate.sh $NAME_PROJECT $NAME_UTIL
    echo '        - Util, OK!'
    echo ' '
  ;;

  # PAGINAS ESPECIFICAS
  task-ui-initial)
    ./src/task-ui-initial/home-ui.generate.sh $NAME_PROJECT
    ./src/task-ui-initial/load-task.generate.sh $NAME_PROJECT
    echo '        - Home-UI, OK!'
    echo '        - Load-TASK, OK!'
    echo ' '
  ;;


  *)
    echo '¡Selección Incorrecta!'
    echo ' '
  ;;
esac


echo 'Desea agregar elementos (y/n)?'
read _CONDICION
echo ' '
done