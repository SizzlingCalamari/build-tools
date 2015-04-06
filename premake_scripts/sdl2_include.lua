
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
    prelinkcommands
    {
        "{COPY} "..base_dir.."/build/.libs/libSDL2*%{cfg.buildtarget.extension}* "..output_dir
    }
filter { "system:windows", "platforms:x32" }
    prelinkcommands
    {
        "{COPY} "..base_dir.."/VisualC/SDL/Win32/Release/SDL2.* "..output_dir
    }
filter { "system:windows", "platforms:x64" }
    prelinkcommands
    {
        "{COPY} "..base_dir.."/VisualC/SDL/x64/Release/SDL2.* "..output_dir
    }
filter{}
