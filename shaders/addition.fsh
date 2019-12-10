#ifdef GL_ES
precision mediump float;
#endif


#ifdef GL_ES
precision lowp float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;


uniform vec4		color_v4;


void main() {
	vec4 src = v_fragmentColor * texture2D(CC_Texture0, v_texCoord);//texture2D(u_texture, vec2(v_texCoord.x, v_texCoord.y));
	gl_FragColor = src + color_v4 * src.w;// - vec3(src.x, src.y, src.z); // * v_fragmentColor;
}
