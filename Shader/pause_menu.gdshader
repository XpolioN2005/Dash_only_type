shader_type canvas_item;


void fragment() {
	vec2 uv = UV;
	float x_offset = uv.x * 0.5;
	//float cut_line = uv.x -uv.y;
	if (uv.x+uv.y < 1.0-(x_offset)) {
		discard;
	}
	if (uv.x+uv.y < 1.03-(x_offset)) {
		COLOR = vec4(1.0);
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
