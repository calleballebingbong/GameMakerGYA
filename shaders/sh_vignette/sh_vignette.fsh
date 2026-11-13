varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_vignette_strength;

void main() {
    vec4 color = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;
    vec2 centered = (v_vTexcoord - 0.5) * 2.0;
    float edge = smoothstep(0.35, 1.5, dot(centered, centered));

    color.rgb *= 1.0 - edge * u_vignette_strength;
    gl_FragColor = color;
}
