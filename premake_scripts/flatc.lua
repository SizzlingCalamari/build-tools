
local base_dir, output_dir = ...

project "_FlatC"
    targetname "flatc"
    kind "ConsoleApp"
    language "C++"

    includedirs
    {
        base_dir .. "/include/"
    }
    files
    {
        base_dir .. "/src/**.cpp"
    }
project "*"
