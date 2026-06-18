#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;
uniform int FogShape;

in vec2 texCoord0;
in float vertexDistance;
in vec4 vertexColor;
in vec3 vertexPos;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
    color.a *= linear_fog_fade(fog_distance(vertexPos.xyz, FogShape), FogStart, FogEnd);

    if (color.a < 0.05) {
        discard;
    }
    fragColor = color;
}
