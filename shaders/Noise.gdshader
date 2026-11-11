shader_type spatial;

uniform sampler2D noise_texture : repeat_enable;
uniform vec4 main_Color : source_color = vec4(1.0);
uniform vec4 secondary_Color : source_color = vec4(0.0,0.0,0.0,1.0);

void fragment(){
	vec2 uv = UV;
	uv.y += sin(uv.x * 20.0 + TIME * 2.0) * 0.01;
	
    float noise = texture(noise_texture, uv).r;
    ALBEDO = mix(secondary_Color.rgb, main_Color.rgb, noise);
}
