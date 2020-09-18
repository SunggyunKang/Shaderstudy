﻿Shader "ShaderStudy / Test / Lerp"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
	    _MainTex2 ("ALbedo (RGB)", 2D) = "white" {}
	    _lerpTest ("LerpTest", Range(0,1)) = 0.5
	}
    SubShader
    {
        Tags { "RenderType"="Opaque" }
		LOD 200

        CGPROGRAM
        #pragma surface surf Standard


        sampler2D _MainTex;
	    sampler2D _MainTex2;
		float _lerpTest;


        struct Input
        {
            float2 uv_MainTex;
			float2 uv_MainTex2;
		};



        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
			fixed4 d = tex2D (_MainTex2, IN.uv_MainTex2);
			o.Albedo = lerp(d.rgb, c.rgb, c.a);
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
