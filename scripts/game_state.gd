extends Node

signal score_changed(score: int)
signal lives_changed(lives: int)

var score: int = 0
var lives: int = 3

func _ready() -> void:
    emit_signal("score_changed", score)
    emit_signal("lives_changed", lives)

func reset() -> void:
    score = 0
    lives = 3
    emit_signal("score_changed", score)
    emit_signal("lives_changed", lives)

func add_score(v: int) -> void:
    score += v
    emit_signal("score_changed", score)

func lose_life() -> void:
    lives -= 1
    emit_signal("lives_changed", lives)
    if lives <= 0:
        # Simple game over: reload current scene
        var tree := get_tree()
        if tree:
            tree.reload_current_scene()
