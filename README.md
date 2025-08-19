# 2D Platformer – Godot (GDScript)

A clean, beginner‑friendly 2D platformer built with **Godot 4.x** and **GDScript**. It features a controllable character with jump physics, collectible coins, a simple patrolling enemy, and HUD with score & lives

## Features
- Character movement with jump & coyote‑time‑friendly physics
- Coins that increase score
- Simple left/right patrolling enemy with stomp‑to‑defeat or take damage
- Lives counter & scene reset on game over
- Camera follows the player
- Minimal visuals using `Polygon2D`

## Tech Stack
- **Engine:** Godot 4.x
- **Language:** GDScript

## ▶Getting Started
1. **Install Godot 4.x** from https://godotengine.org/.
2. **Open the project**: `Project > Import`, pick this folder (contains `project.godot`).
3. Press **Play**. The main scene is already set to `scenes/Main.tscn`.

## Controls
- **Left/Right:** Arrow keys or `A/D`
- **Jump:** `Space` (or the default `ui_accept` action)

## 🧪 Design Notes
See [`docs/DESIGN.md`](docs/DESIGN.md) for mechanics and signals.

