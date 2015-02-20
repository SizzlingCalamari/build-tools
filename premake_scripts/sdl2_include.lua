
local base_dir, output_dir = ...

includedirs
{
    base_dir.."/include/"
}
links
{
    "_SDL2"
}
filter "system:not windows"
    postbuildcommands
    {
        "{COPY} libSDL2* ../../../bin/"
    }
filter "system:windows"
    postbuildcommands
    {
        "{COPY} SDL2.dll ../../../bin/"
    }
filter{}
