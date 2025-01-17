Shader "Horizon Forge/TintBlit"
{
    Properties {
        _In("_In", 2D) = "white" {}
        _Out("_Out", 2D) = "white" {}
        _Color("_Color", Color) = (1,1,1,1)
        _Alpha("_Alpha", Color) = (1,1,1,1)
    }

        SubShader {
            Pass {
                SetTexture[_In] { 
                    //combine texture
                }
                SetTexture[_Out] {
                    constantColor[_Color]
                    combine constant * previous, constant * previous
                }
                SetTexture[_Out] {
                    constantColor[_Alpha]
                    combine previous, constant lerp(constant) previous
                }
            }
        }
}