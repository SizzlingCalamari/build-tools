
local incl_prefix, base_dir = ...

project "flatbuffers"
    kind "StaticLib"
    language "C++"
    
    defines
    {
    }
    includedirs
    {
        incl_prefix .. base_dir .. "/include/"
    }
    files
    {
        base_dir .. "/src/idl_parser.cpp",
        base_dir .. "/src/idl_gen_text.cpp"
    }
project "flatc"
    kind "ConsoleApp"
    language "C++"
    
    defines
    {
    }
    includedirs
    {
        incl_prefix .. base_dir .. "/include/"
    }
    files
    {
        base_dir .. "/src/**.cpp"
    }
project "*"
