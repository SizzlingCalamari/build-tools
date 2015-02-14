
local incl_prefix, base_dir = ...

includedirs
{
    incl_prefix .. base_dir .. "/include/"
}
links
{
    "flatbuffers"
}
