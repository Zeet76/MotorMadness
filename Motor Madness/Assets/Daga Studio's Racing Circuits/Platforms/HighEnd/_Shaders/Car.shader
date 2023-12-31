// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DSRC/PC/Car"
{
	Properties
	{
		_CarMain_Base_Color("CarMain_Base_Color", 2D) = "white" {}
		_CarMain_MRAO("CarMain_MRAO", 2D) = "white" {}
		_CarMain_N("CarMain_N", 2D) = "bump" {}
		_Value("Value", Range( 0 , 1)) = 0
		_Float0("Float 0", Range( 0 , 1)) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _CarMain_N;
		uniform float4 _CarMain_N_ST;
		uniform sampler2D _CarMain_Base_Color;
		uniform float4 _CarMain_Base_Color_ST;
		uniform sampler2D _CarMain_MRAO;
		uniform float4 _CarMain_MRAO_ST;
		uniform float _Value;
		uniform float _Float0;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_CarMain_N = i.uv_texcoord * _CarMain_N_ST.xy + _CarMain_N_ST.zw;
			o.Normal = UnpackNormal( tex2D( _CarMain_N, uv_CarMain_N ) );
			float2 uv_CarMain_Base_Color = i.uv_texcoord * _CarMain_Base_Color_ST.xy + _CarMain_Base_Color_ST.zw;
			o.Albedo = tex2D( _CarMain_Base_Color, uv_CarMain_Base_Color ).rgb;
			float2 uv_CarMain_MRAO = i.uv_texcoord * _CarMain_MRAO_ST.xy + _CarMain_MRAO_ST.zw;
			float4 tex2DNode2 = tex2D( _CarMain_MRAO, uv_CarMain_MRAO );
			o.Metallic = tex2DNode2.r;
			o.Smoothness = ( tex2DNode2.g * _Value );
			o.Occlusion = ( ( 1.0 - _Float0 ) + tex2DNode2.b );
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18102
1920;187;1734;760;1592.68;-49.0036;1.427983;True;True
Node;AmplifyShaderEditor.RangedFloatNode;10;-769.2359,650.5854;Inherit;False;Property;_Float0;Float 0;4;0;Create;True;0;0;False;0;False;1;0.777;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2;-665.3505,320.3415;Inherit;True;Property;_CarMain_MRAO;CarMain_MRAO;1;0;Create;True;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;5;-615.7925,527.5561;Inherit;False;Property;_Value;Value;3;0;Create;True;0;0;False;0;False;0;0.75;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;12;-432.6526,666.3337;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1;-639.1492,-76.16229;Inherit;True;Property;_CarMain_Base_Color;CarMain_Base_Color;0;0;Create;True;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-682.278,124.3387;Inherit;True;Property;_CarMain_N;CarMain_N;2;0;Create;True;0;0;False;0;False;-1;f86fe60b296eb8c48bbb53b28a112328;f86fe60b296eb8c48bbb53b28a112328;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4;-203.7362,403.6871;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;11;-244.3528,593.832;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;;0;0;Standard;DSRC/PC/Car;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;12;0;10;0
WireConnection;4;0;2;2
WireConnection;4;1;5;0
WireConnection;11;0;12;0
WireConnection;11;1;2;3
WireConnection;0;0;1;0
WireConnection;0;1;3;0
WireConnection;0;3;2;1
WireConnection;0;4;4;0
WireConnection;0;5;11;0
ASEEND*/
//CHKSM=A9E7E872B13484FFFD4A04BDB93477526746F8BA