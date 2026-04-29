#version 440

layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
    float time;
    float amplitude;
    vec4 color1;
    vec4 color2;
};

void main() {
    float x = qt_TexCoord0.x;
    float y = qt_TexCoord0.y;

    float wave =
        sin(x * 10.0 + time * 3.0) * amplitude * 0.4 +
        cos(x * 25.0 + time * 5.0) * amplitude * 0.2;

    float center = 0.5 + wave;
    float dist = abs(y - center);

    float waveLine = smoothstep(0.08, 0.02, dist);

    vec3 col = mix(color1.rgb, color2.rgb, x);

    fragColor = vec4(col, waveLine);
}
