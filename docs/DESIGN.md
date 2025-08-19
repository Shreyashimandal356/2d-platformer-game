# Design Notes

## Entities
- **Player** (`CharacterBody2D`): Movement, jump, bounce after stomping enemies, respawn on hit.
- **Enemy** (`Area2D`): Horizontal patrol between `left_limit` and `right_limit`. If the player hits from above while falling, the enemy is defeated; otherwise the player takes damage.
- **Coin** (`Area2D`): On body enter (player), awards points and frees itself.
- **Platform** (`StaticBody2D`): Rectangular platforms with procedural polygon fill and collision.
- **HUD** (`CanvasLayer` + `Label`): Displays score and lives via `GameState` signals.
- **GameState** (autoload): Score/lives and signals for HUD; reloads scene on game over.

## Signals
- `GameState.score_changed(score: int)`
- `GameState.lives_changed(lives: int)`

## Physics
- Gravity applied in `Player` when not on floor.
- Movement uses acceleration/friction for snappy yet controllable feel.
- Jump buffer and coyote time can be added easily (kept simple here).

## Scenes
`Main.tscn` instantiates a minimal level with:
- Ground platform
- Two elevated platforms
- One patrolling enemy
- A handful of coins
- `HUD` and `Player` (with a following `Camera2D`)

## Extending
- Create more levels by duplicating `Main.tscn` and adjusting platform positions.
- Add more enemy types by duplicating `Enemy.tscn` and changing behavior.
- Swap polygons for sprites/tiles later without changing game logic.
