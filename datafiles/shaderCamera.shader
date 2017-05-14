//Shader shaderCamera (Vertex)
//By Alain Galvan
//A combination of shaders specific to the camera, to aid with post processing effects.
////////////////////////////////////////////////////////////////////////////////////////
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//Shader shaderCamera (Fragment)
//By Alain Galvan
//A combination of shaders specific to the camera, to aid with post processing effects.
////////////////////////////////////////////////////////////////////////////////////////
//Initial Vars
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

//Gussian Blur Values
uniform float sigma;
uniform float blurSize;
float pii = 3.14159265;
float numBlurPixelsPerSide = 3.0;
vec2 blurMultiplyVec = vec2(1.0, 0.0);

//Curves Values
uniform sampler2D texCurve;

uniform sampler2D texOverlay;

uniform sampler2D texVignette;
////////////////////////////////////////////////////////////////////////////////////////
//blurSample - Blurs a sampler. 
////////////////////////////////////////////////////////////////////////////////////////
vec4 blurSample(sampler2D baseTex, float sigma, float blurSize)
{
    if (sigma > 0.001)
    {
        vec4 outColor = vec4(0.0, 0.0, 0.0, 0.0);
        vec3 incrementalGaussian;
        incrementalGaussian.x = 1.0 / (sqrt(2.0 * pii) * sigma);
        incrementalGaussian.y = exp(-0.5 / (sigma * sigma));
        incrementalGaussian.z = incrementalGaussian.y * incrementalGaussian.y;

        vec4 avgValue = vec4(0.0, 0.0, 0.0, 0.0);
        float coefficientSum = 0.0;

        // Take the central sample first...
        avgValue += texture2D(baseTex, v_vTexcoord.xy) * incrementalGaussian.x;
        coefficientSum += incrementalGaussian.x;
        incrementalGaussian.xy *= incrementalGaussian.yz;

        // Go through the remaining 8 vertical samples
        for (float i = 1.0; i <= numBlurPixelsPerSide; i++)
        {
            avgValue += texture2D(baseTex, v_vTexcoord.xy - i * blurSize * blurMultiplyVec) * incrementalGaussian.x;
            avgValue += texture2D(baseTex, v_vTexcoord.xy + i * blurSize * blurMultiplyVec) * incrementalGaussian.x;
            coefficientSum += 2.0 * incrementalGaussian.x;
            incrementalGaussian.xy *= incrementalGaussian.yz;
        }
        outColor += (avgValue / coefficientSum);
        return outColor;
    }
    return texture2D(baseTex, v_vTexcoord);
}
////////////////////////////////////////////////////////////////////////////////////////
//curveColor - Applies Curves to a sample. 
////////////////////////////////////////////////////////////////////////////////////////
vec4 curveColor(vec4 inColor, sampler2D texCurve)
{
    vec4 outColor = vec4(texture2D(texCurve, vec2(inColor.r, 0)).r, texture2D(texCurve, vec2(inColor.g, 0)).g, texture2D(texCurve, vec2(inColor.b, 0)).b, 1.0);
    return outColor;
}

////////////////////////////////////////////////////////////////////////////////////////
//vignetteColor - Applies Vignette to a sample. 
////////////////////////////////////////////////////////////////////////////////////////
vec4 vignetteColor(vec4 inColor, sampler2D texVignette)
{
    vec4 multiply = texture2D(texVignette, v_vTexcoord);
    return inColor * multiply;
}

////////////////////////////////////////////////////////////////////////////////////////
//overlayColor- Applies an overlay to a sample. 
////////////////////////////////////////////////////////////////////////////////////////
vec4 overlayColor(vec4 inColor, sampler2D texOverlay)
{
    vec4 outColor = vec4(0.0, 0.0, 0.0, 1.0);
    vec4 overlay = texture2D(texOverlay, v_vTexcoord);

    if (inColor.r > 0.5)
    {
        outColor.r = (1.0 - (1.0 - 2.0 * (inColor.r - 0.5)) * (1.0 - overlay.r));
    }
    else
    {
        outColor.r = ((2.0 * inColor.r) * overlay.r);
    }

    if (inColor.g > 0.5)
    {
        outColor.g = (1.0 - (1.0 - 2.0 * (inColor.g - 0.5)) * (1.0 - overlay.g));
    }
    else
    {
        outColor.g = ((2.0 * inColor.g) * overlay.g);
    }

    if (inColor.b > 0.5)
    {
        outColor.b = (1.0 - (1.0 - 2.0 * (inColor.b - 0.5)) * (1.0 - overlay.b));
    }
    else
    {
        outColor.b = ((2.0 * inColor.b) * overlay.b);
    }
    return outColor;
}
////////////////////////////////////////////////////////////////////////////////////////
//main - Main Program
////////////////////////////////////////////////////////////////////////////////////////
void main()
{
    vec4 outColor = vec4(0.0, 0.0, 0.0, 0.0);

    outColor = blurSample(gm_BaseTexture, sigma, blurSize) * v_vColour;
    outColor = curveColor(outColor, texCurve);
    //outColor = vignetteColor(outColor, texVignette);
    
    gl_FragColor = outColor;
}
