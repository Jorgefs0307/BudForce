<div align="center">

# BudForce
### Videojuego arcade 2D tipo *bullet-heaven* desarrollado en Godot 4

[![Godot 4](https://img.shields.io/badge/Godot_4-478CBF?style=for-the-badge&logo=godotengine&logoColor=white)]()
[![GDScript](https://img.shields.io/badge/GDScript-355570?style=for-the-badge&logo=godotengine&logoColor=white)]()
[![Estado](https://img.shields.io/badge/Estado-En_Desarrollo-D97706?style=for-the-badge)]()

</div>

---

## Descripción

**BudForce** es un proyecto personal de desarrollo de videojuegos en **Godot 4** con **GDScript**. El objetivo es construir un título arcade 2D centrado en la supervivencia frente a oleadas crecientes de enemigos, con control independiente de movimiento y disparo, y una arquitectura modular basada en escenas y señales.

---

## Funcionalidades implementadas

- **Movimiento del jugador:** Desplazamiento en 8 direcciones con velocidad normalizada (`CharacterBody2D`).
- **Sistema de disparo:** Disparo direccional manual en 8 direcciones independiente del movimiento, regulado por cadencia (`cooldown`).
- **Generación de enemigos:** *Spawner* automático mediante `Timer` que instancia enemigos alrededor de la posición del jugador.
- **Combate y colisiones:** Detección de impactos entre proyectiles (`Area2D`) y enemigos mediante grupos (`Enemies`), con gestión de puntos de vida y eliminación.

---

## Controles

| Acción | Teclas |
| :--- | :--- |
| **Movimiento** | `W` `A` `S` `D` |
| **Disparo direccional** | `↑` `↓` `←` `→` |

---

## Estructura del proyecto

```text
BudForce/
├── project.godot
├── scenes/
│   ├── main.tscn       # Escena principal y gestión del spawner
│   ├── player.tscn     # Jugador
│   ├── enemy.tscn      # Enemigo base
│   └── bullet.tscn     # Proyectil
└── scripts/
    ├── main.gd         # Temporizador e instanciación de enemigos
    ├── player.gd       # Control de movimiento y disparo
    ├── enemy.gd        # Comportamiento del enemigo y sistema de daño
    └── bullet.gd       # Trayectoria y detección de colisiones
