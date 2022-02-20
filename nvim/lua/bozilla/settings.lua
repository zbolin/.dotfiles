vim.g.mapleader = " "

local time = os.date("*t")


if ( time.hour > 7 and time.hour < 15)
then
    vim.g.tokyonight_style = "dark"
elseif( time.hour > 15 and time.hour < 20 )
then
    vim.g.tokyonight_style = "storm"
else
    vim.g.tokyonight_style = "night"
end
