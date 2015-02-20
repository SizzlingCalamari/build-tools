
local base_dir, output_dir = ...

includedirs
{
    base_dir.."/include/"
}
dependson
{
    "_SDL2"
}
links
{
    "SDL2"
}
