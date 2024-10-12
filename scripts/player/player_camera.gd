extends Camera2D
class_name PlayerCamera

func set_camera_shape(shape: CollisionShape2D) -> void:
	""" Set player`s camera offset using collision shape size, pos, and scale """
	if not shape:
		printerr("Camera shape not found!")
		return
		
	var shape_size: Vector2 = shape.shape.size * shape.global_scale
	
	
	var left_limiter = shape.global_position.x - shape_size.x  / 2
	var right_limiter = shape.global_position.x + shape_size.x / 2
	var top_limiter = shape.global_position.y - shape_size.y / 2
	var bottom_limiter = shape.global_position.y + shape_size.y / 2
	
	self.limit_left = left_limiter
	self.limit_top = top_limiter
	self.limit_right = right_limiter
	self.limit_bottom = bottom_limiter
