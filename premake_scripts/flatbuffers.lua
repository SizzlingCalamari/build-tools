
local incl_prefix, base_dir = ...
print(incl_prefix)
print(base_dir)
print(base_dir .. "/src/**.cpp")

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
