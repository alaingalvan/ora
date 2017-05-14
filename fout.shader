float2 vec2(float x0, float x1)
{
    return float2(x0, x1);
}
float4 vec4(float x0, float x1, float x2, float x3)
{
    return float4(x0, x1, x2, x3);
}
// Varyings
static float4 _v_vColour = {0, 0, 0, 0};
static float2 _v_vTexcoord = {0, 0};

static float4 gl_Color[1] =
{
    float4(0, 0, 0, 0)
};


uniform float _blurSize : register(c3);
uniform float _gm_AlphaRefValue : register(c4);
uniform bool _gm_AlphaTestEnabled : register(c5);
uniform sampler2D _gm_BaseTexture : register(s0);
uniform float4 _gm_FogColour : register(c6);
uniform bool _gm_PS_FogEnabled : register(c7);
uniform float _sigma : register(c8);
uniform sampler2D _texCurve : register(s1);
uniform sampler2D _texVignette : register(s2);

float4 gl_texture2D(sampler2D s, float2 t)
{
    return tex2D(s, t);
}

float4 gl_texture2DLod0(sampler2D s, float2 t)
{
    return tex2Dlod(s, float4(t.x, t.y, 0, 0));
}

#define GL_USES_FRAG_COLOR
;
;
;
;
;
void _DoAlphaTest(in float4 _SrcColour)
{
{
if(_gm_AlphaTestEnabled)
{
{
if((_SrcColour.w <= _gm_AlphaRefValue))
{
{
discard;
;
}
;
}
;
}
;
}
;
}
}
void _DoAlphaTestLod0(in float4 _SrcColour)
{
{
if(_gm_AlphaTestEnabled)
{
{
if((_SrcColour.w <= _gm_AlphaRefValue))
{
{
discard;
;
}
;
}
;
}
;
}
;
}
}
;
void _DoFog(inout float4 _SrcColour, in float _fogval)
{
{
if(_gm_PS_FogEnabled)
{
{
(_SrcColour = lerp(_SrcColour, _gm_FogColour, clamp(_fogval, 0.0, 1.0)));
}
;
}
;
}
}
void _DoFogLod0(inout float4 _SrcColour, in float _fogval)
{
{
if(_gm_PS_FogEnabled)
{
{
(_SrcColour = lerp(_SrcColour, _gm_FogColour, clamp(_fogval, 0.0, 1.0)));
}
;
}
;
}
}
;
;
;
;
;
;
;
static float _pii = 3.1415927;
static float _numBlurPixelsPerSide = 3.0;
static float2 _blurMultiplyVec = float2(1.0, 0.0);
;
;
float4 _blurSample(in sampler2D _baseTex, in float _sigma, in float _blurSize)
{
{
if((_sigma > 0.001))
{
{
float4 _outColor = float4(0.0, 0.0, 0.0, 0.0);
float3 _incrementalGaussian = {0, 0, 0};
(_incrementalGaussian.x = (1.0 / (sqrt((2.0 * _pii)) * _sigma)));
(_incrementalGaussian.y = exp((-0.5 / (_sigma * _sigma))));
(_incrementalGaussian.z = (_incrementalGaussian.y * _incrementalGaussian.y));
float4 _avgValue = float4(0.0, 0.0, 0.0, 0.0);
float _coefficientSum = 0.0;
(_avgValue += (gl_texture2D(_baseTex, _v_vTexcoord.xy) * _incrementalGaussian.x));
(_coefficientSum += _incrementalGaussian.x);
(_incrementalGaussian.xy *= _incrementalGaussian.yz);
{for(float _i = 1.0; (_i <= _numBlurPixelsPerSide); (_i++))
{
{
(_avgValue += (gl_texture2D(_baseTex, (_v_vTexcoord.xy - ((_i * _blurSize) * _blurMultiplyVec))) * _incrementalGaussian.x));
(_avgValue += (gl_texture2D(_baseTex, (_v_vTexcoord.xy + ((_i * _blurSize) * _blurMultiplyVec))) * _incrementalGaussian.x));
(_coefficientSum += (2.0 * _incrementalGaussian.x));
(_incrementalGaussian.xy *= _incrementalGaussian.yz);
}
;}
}
;
(_outColor += (_avgValue / _coefficientSum));
return _outColor;
;
}
;
}
;
return gl_texture2D(_baseTex, _v_vTexcoord);
;
}
}
float4 _blurSampleLod0(in sampler2D _baseTex, in float _sigma, in float _blurSize)
{
{
if((_sigma > 0.001))
{
{
float4 _outColor = float4(0.0, 0.0, 0.0, 0.0);
float3 _incrementalGaussian = {0, 0, 0};
(_incrementalGaussian.x = (1.0 / (sqrt((2.0 * _pii)) * _sigma)));
(_incrementalGaussian.y = exp((-0.5 / (_sigma * _sigma))));
(_incrementalGaussian.z = (_incrementalGaussian.y * _incrementalGaussian.y));
float4 _avgValue = float4(0.0, 0.0, 0.0, 0.0);
float _coefficientSum = 0.0;
(_avgValue += (gl_texture2DLod0(_baseTex, _v_vTexcoord.xy) * _incrementalGaussian.x));
(_coefficientSum += _incrementalGaussian.x);
(_incrementalGaussian.xy *= _incrementalGaussian.yz);
{for(float _i = 1.0; (_i <= _numBlurPixelsPerSide); (_i++))
{
{
(_avgValue += (gl_texture2DLod0(_baseTex, (_v_vTexcoord.xy - ((_i * _blurSize) * _blurMultiplyVec))) * _incrementalGaussian.x));
(_avgValue += (gl_texture2DLod0(_baseTex, (_v_vTexcoord.xy + ((_i * _blurSize) * _blurMultiplyVec))) * _incrementalGaussian.x));
(_coefficientSum += (2.0 * _incrementalGaussian.x));
(_incrementalGaussian.xy *= _incrementalGaussian.yz);
}
;}
}
;
(_outColor += (_avgValue / _coefficientSum));
return _outColor;
;
}
;
}
;
return gl_texture2DLod0(_baseTex, _v_vTexcoord);
;
}
}
;
float4 _curveColor(in float4 _inColor, in sampler2D _texCurve)
{
{
return vec4(gl_texture2D(_texCurve, vec2(_inColor.x, 0.5)).x, gl_texture2D(_texCurve, vec2(_inColor.y, 0.5)).y, gl_texture2D(_texCurve, vec2(_inColor.z, 0.5)).z, _inColor.w);
;
}
}
float4 _curveColorLod0(in float4 _inColor, in sampler2D _texCurve)
{
{
return vec4(gl_texture2DLod0(_texCurve, vec2(_inColor.x, 0.5)).x, gl_texture2DLod0(_texCurve, vec2(_inColor.y, 0.5)).y, gl_texture2DLod0(_texCurve, vec2(_inColor.z, 0.5)).z, _inColor.w);
;
}
}
;
float4 _vignetteColor(in float4 _inColor, in sampler2D _texVignette)
{
{
float4 _multiply = gl_texture2D(_texVignette, _v_vTexcoord);
return (_inColor * _multiply);
;
}
}
float4 _vignetteColorLod0(in float4 _inColor, in sampler2D _texVignette)
{
{
float4 _multiply = gl_texture2DLod0(_texVignette, _v_vTexcoord);
return (_inColor * _multiply);
;
}
}
;
float4 _overlayColor(in float4 _inColor, in sampler2D _texOverlay)
{
{
float4 _outColor = float4(0.0, 0.0, 0.0, 1.0);
float4 _overlay = gl_texture2D(_texOverlay, _v_vTexcoord);
if((_inColor.x > 0.5))
{
{
(_outColor.x = (1.0 - ((1.0 - (2.0 * (_inColor.x - 0.5))) * (1.0 - _overlay.x))));
}
;
}
else
{
{
(_outColor.x = ((2.0 * _inColor.x) * _overlay.x));
}
;
}
;
if((_inColor.y > 0.5))
{
{
(_outColor.y = (1.0 - ((1.0 - (2.0 * (_inColor.y - 0.5))) * (1.0 - _overlay.y))));
}
;
}
else
{
{
(_outColor.y = ((2.0 * _inColor.y) * _overlay.y));
}
;
}
;
if((_inColor.z > 0.5))
{
{
(_outColor.z = (1.0 - ((1.0 - (2.0 * (_inColor.z - 0.5))) * (1.0 - _overlay.z))));
}
;
}
else
{
{
(_outColor.z = ((2.0 * _inColor.z) * _overlay.z));
}
;
}
;
return _outColor;
;
}
}
float4 _overlayColorLod0(in float4 _inColor, in sampler2D _texOverlay)
{
{
float4 _outColor = float4(0.0, 0.0, 0.0, 1.0);
float4 _overlay = gl_texture2DLod0(_texOverlay, _v_vTexcoord);
if((_inColor.x > 0.5))
{
{
(_outColor.x = (1.0 - ((1.0 - (2.0 * (_inColor.x - 0.5))) * (1.0 - _overlay.x))));
}
;
}
else
{
{
(_outColor.x = ((2.0 * _inColor.x) * _overlay.x));
}
;
}
;
if((_inColor.y > 0.5))
{
{
(_outColor.y = (1.0 - ((1.0 - (2.0 * (_inColor.y - 0.5))) * (1.0 - _overlay.y))));
}
;
}
else
{
{
(_outColor.y = ((2.0 * _inColor.y) * _overlay.y));
}
;
}
;
if((_inColor.z > 0.5))
{
{
(_outColor.z = (1.0 - ((1.0 - (2.0 * (_inColor.z - 0.5))) * (1.0 - _overlay.z))));
}
;
}
else
{
{
(_outColor.z = ((2.0 * _inColor.z) * _overlay.z));
}
;
}
;
return _outColor;
;
}
}
;
void gl_main()
{
{
float4 _outColor = float4(0.0, 0.0, 0.0, 0.0);
(_outColor = (_blurSample(_gm_BaseTexture, _sigma, _blurSize) * _v_vColour));
(_outColor = _curveColor(_outColor, _texCurve));
(_outColor = _overlayColor(_outColor, _texVignette));
(gl_Color[0] = _outColor);
}
}
;
struct PS_INPUT
{
    float4 v0 : TEXCOORD0;
    float2 v1 : TEXCOORD1;
};

struct PS_OUTPUT
{
    float4 gl_Color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT input)
{
    _v_vColour = input.v0;
    _v_vTexcoord = input.v1.xy;

    gl_main();

    PS_OUTPUT output;
    output.gl_Color0 = gl_Color[0];

    return output;
}
