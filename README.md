# MoveOrDie

Mauricio Vargas Escobar
56224

## Cumplimiento de Requisitos

* Hago uso de sprite sheets para los personajes y tilemaps para el escenario, inclyendo uso de autotile
* Cada escena contiene subnodos, modularizando el código
* Los jugadores se mueven con teclas
* Los jugadores se ven afectados por su ambiente. Se aplica aceleración para su movimiento en el eje x, fricción para detener ese movimiento 
y gravedad para su movimiento en y, además de varias modificaciones a estos fenómenos para hacer una jugabilidad más fluida.
Así mismo la bola con pinchos rebota en las paredes, rota y va aumentado su velocidad.
* El monigote blanco colocado entre las barras de vida en la parte inferior de la pantalla cuenta con el requisito de 3 animaciones, un nodo
AnimationTree y un flujo controlado por una máquina de estados como se pidió. Este reacciona al cambio de vida del jugador 1.
* El juego ejemplifica un minijuego concreto con la mecánica de "Muevete o Mueres" al escapar de una bola y sobrevivir, 
por lo que es un proyecto testeable y jugable por completo.

### ¿Como ejecutar?

Descargar el repositorio completo e importar como proyecto nuevo dentro del motor Godot.

Abrir el explorador de archivos de Godot e importar de la carpeta MoveOrDie el archivo project.godot.

Darle play al proyecto.

## Descripción

El juego está diseñado para dos jugadores y la mecánica principal es no dejarnos de mover en ningún momento,
ya que la barra de vida disminuirá al quedarnos quietos y se restaura al movernos. Saltar o movernos en el aire
no nos ayudará, debemos estar en alguna plataforma para sobrevivir.

Al mismo tiempo, una bola con pinchos gigante se mueve y rebota en la pantalla, por lo que debemos evitar a toda 
costa que ésta nos toque. Su velocidad irá aumentando conforme vaya chocando con las paredes.

En teclado, el jugador 1 se mueve con las flechas direccionales y el jugador 2 con WASD.
