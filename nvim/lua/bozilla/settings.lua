vim.g.mapleader = " "

local time = os.date("*t")


if ( time.hour > 9 and time.hour < 11)
then
    vim.g.tokyonight_style = "day"
elseif( time.hour > 15 and time.hour < 20 )
then
    vim.g.tokyonight_style = "storm"
else
    vim.g.tokyonight_style = "night"
end
