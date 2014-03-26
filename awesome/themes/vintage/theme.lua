-- dunzor3, awesome3 theme, by dunz0r, modified by chomik

--{{{ Main
local awful = require("awful")
awful.util = require("awful.util")

theme = {}

home          = os.getenv("HOME")
config        = awful.util.getdir("config")
shared        = "/usr/share/awesome"
if not awful.util.file_readable(shared .. "/icons/awesome16.png") then
    shared    = "/usr/share/local/awesome"
end
sharedicons   = shared .. "/icons"
sharedthemes  = shared .. "/themes"
themes        = config .. "/themes"
themename     = "/vintage"
if not awful.util.file_readable(themes .. themename .. "/theme.lua") then
       themes = sharedthemes
end
themedir      = themes .. themename

wallpaper1    = themedir .. "/background.jpg"
wallpaper2    = themedir .. "/background.png"
wallpaper3    = sharedthemes .. "/zenburn/zenburn-background.png"
wallpaper4    = sharedthemes .. "/default/background.png"
wpscript      = home .. "/.wallpaper"

if awful.util.file_readable(wallpaper1) then
        theme.wallpaper = wallpaper1
elseif awful.util.file_readable(wallpaper2) then
        theme.wallpaper = wallpaper2
elseif awful.util.file_readable(wpscript) then
        theme.wallpaper_cmd = { "sh " .. wpscript }
elseif awful.util.file_readable(wallpaper3) then
        theme.wallpaper = wallpaper3
else
        theme.wallpaper = wallpaper4
end

if awful.util.file_readable(config .. "/vain/init.lua") then
    theme.useless_gap_width  = "3"
end
--}}}

theme.font          = "Ubuntu Light 8"

theme.bg_normal     = "#00000000"
theme.bg_focus      = "#c23f3faa"
theme.bg_urgent     = "#303030aa"
theme.bg_minimize   = "#00000000"

theme.fg_normal     = "#eddbc3"
theme.fg_focus      = "#eddbc3"
theme.fg_unfocus    = "#606060"
theme.fg_urgent     = "#ffcc00"
theme.fg_highlight  = "#ffcc00"
theme.fg_minimize   = "#ffcc00"

theme.border_width  = "1"
theme.border_normal = "#30363d00"
theme.border_focus  = "#c23f3f44"
theme.border_marked = "#91231c44"

-- widget colours
theme.wid_rl = "#d94c3a"
theme.wid_rh = "#cfa3a9"
theme.wid_gl = "#66825d"
theme.wid_gh = "#caf7bb"
theme.wid_yl = "#969176"
theme.wid_yh = "#fff8bc"
theme.wid_bl = "#4d6585"
theme.wid_bh = "#83aebe"
theme.wid_ml = "#967395"
theme.wid_mh = "#bba9cf"
theme.wid_cl = "#5f7f7b"
theme.wid_ch = "#96cccc"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- Example:
--theme.taglist_fg_focus = "#ff0000"
--
theme.taglist_fg_focus = "#c23f3f"
theme.taglist_fg_urgent = "#ccff00"

theme.taglist_bg_focus = "#00000000"
theme.taglist_bg_urgent = "#00000000"

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
theme.fg_widget        = "#AECF96"
theme.fg_center_widget = "#88A175"
theme.fg_end_widget    = "#FF5656"
theme.bg_widget        = "#00000000"
theme.border_widget    = "#00000000"
theme.bg_systray        = "#6f2a4e00"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = "15"
theme.menu_width  = "100"
theme.menu_border_width  = "0"
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = sharedthemes .. "/zenburn/taglist/squarefz.png"
theme.taglist_squares_unsel = sharedthemes .. "/zenburn/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = sharedthemes .. "/zenburn/awesome-icon.png"
theme.awesome_icon           = "/home/michal/.local/share/icons/start-here monochrome light.png"
theme.menu_submenu_icon      = sharedthemes .. "/default/submenu.png"
theme.tasklist_floating_icon = sharedthemes .. "/default/tasklist/floatingw.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = themedir .. "/layouts/tile.png"
theme.layout_tileleft   = themedir .. "/layouts/tileleft.png"
theme.layout_tilebottom = themedir .. "/layouts/tilebottom.png"
theme.layout_tiletop    = themedir .. "/layouts/tiletop.png"
theme.layout_fairv      = themedir .. "/layouts/fairv.png"
theme.layout_fairh      = themedir .. "/layouts/fairh.png"
theme.layout_spiral     = themedir .. "/layouts/spiral.png"
theme.layout_dwindle    = themedir .. "/layouts/dwindle.png"
theme.layout_max        = themedir .. "/layouts/max.png"
theme.layout_fullscreen = themedir .. "/layouts/fullscreen.png"
theme.layout_magnifier  = themedir .. "/layouts/magnifier.png"
theme.layout_floating   = themedir .. "/layouts/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = sharedthemes .. "/zenburn/titlebar/close_focus.png"
theme.titlebar_close_button_normal = sharedthemes .. "/zenburn/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = sharedthemes .. "/zenburn/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = sharedthemes .. "/zenburn/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = sharedthemes .. "/zenburn/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = sharedthemes .. "/zenburn/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = sharedthemes .. "/zenburn/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = sharedthemes .. "/zenburn/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = sharedthemes .. "/zenburn/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = sharedthemes .. "/zenburn/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = sharedthemes .. "/zenburn/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = sharedthemes .. "/zenburn/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = sharedthemes .. "/zenburn/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = sharedthemes .. "/zenburn/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = sharedthemes .. "/zenburn/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = sharedthemes .. "/zenburn/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = sharedthemes .. "/zenburn/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = sharedthemes .. "/zenburn/titlebar/maximized_normal_inactive.png"

-- }}}
-- }}}
return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

