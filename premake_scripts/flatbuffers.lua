
local base_dir = ...

project "_FlatBuffers"
    kind "StaticLib"
    language "C++"

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
