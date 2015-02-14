
local base_dir = ...

project "flatbuffers"
    kind "StaticLib"
    language "C++"
    
    defines
    {
    }
    includedirs
    {
        base_dir .. "/include/"
    }
    files
    {
        base_dir .. "/src/idl_parser.cpp",
        base_dir .. "/src/idl_gen_text.cpp"
    }
project "*"
