extends StaticBody2D

@export var platform_size: Vector2 = Vector2(200, 20)
@export var color: Color = Color(0.20, 0.20, 0.24, 1.0)

func _ready() -> void:
    var cs := $CollisionShape2D
    if cs and cs.shape and cs.shape is RectangleShape2D:
        cs.shape.size = platform_size
    var poly := $Polygon2D
    if poly:
        var w := platform_size.x * 0.5
        var h := platform_size.y * 0.5
        poly.polygon = PackedVector2Array(Vector2(-w,-h), Vector2(w,-h), Vector2(w,h), Vector2(-w,h))
        poly.color = color
