Shader "Custom/NewSurfaceShader"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
	    _MoveX ("MoveX", Range(0,1)) = 0
	    _MoveY ("MoveY", Range(0,1)) = 0
	}
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard 


        sampler2D _MainTex;
		float _MoveX;
		float _MoveY;

        struct Input
        {
            float2 uv_MainTex;
        };



        void surf (Input IN, inout SurfaceOutputStandard o)
        {
			fixed4 c = tex2D (_MainTex, float2(IN.uv_MainTex.x + _Time.z * _MoveY , IN.uv_MainTex.y + _Time.z * _MoveX));
            o.Albedo = c.rgb;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
