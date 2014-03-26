-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local vicious = require("vicious")

local awmodoro = require("awmodoro")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
-- beautiful.init("/usr/share/awesome/themes/zenburn/theme.lua")
beautiful.init("/home/michal/.config/awesome/themes/vintage/theme.lua")
beautiful.useless_gap_width = 5

-- This is used later as the default terminal and editor to run.
terminal = "konsole"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.magnifier
}
-- }}}

-- {{{ Wallpaper
-- if beautiful.wallpaper then
--     for s = 1, screen.count() do
--         gears.wallpaper.maximized(beautiful.wallpaper, s, true)
--     end
-- end
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    -- default:
    -- tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, layouts[1])
    -- tag_names = {'◰', '◳', '◱', '◲'}
    tag_names = {'Α', 'Β', 'Γ', 'Δ'}
    -- tag_names = {'♠', '♥', '♦', '♣'}
    -- tag_names = {'α', 'β', 'γ', 'δ'}
    tags[s] = awful.tag(tag_names, s, {awful.layout.suit.floating,
        awful.layout.suit.floating,
        awful.layout.suit.floating,
        awful.layout.suit.floating})
end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mydisplaysmenu = {
    {"External above internal", ".screenlayout/big_above_small.sh"},
    {"Internal only", ".screenlayout/internal_only.sh"},
    {"External only", ".screenlayout/external_only.sh"}
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu },
                                    { "displays", mydisplaysmenu },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock(" %a %b %d, %H:%M:%S ", 1)

-- Battery widget
battery_widget = wibox.widget.textbox()
battery_widget:set_align("right")
function batteryInfo(adapter)
    local fcur = io.open("/sys/class/power_supply/"..adapter.."/energy_now")
    local fcap = io.open("/sys/class/power_supply/"..adapter.."/energy_full")
    local fsta = io.open("/sys/class/power_supply/"..adapter.."/status")
    local cur = fcur:read()
    local cap = fcap:read()
    local sta = fsta:read()
    local battery = math.floor(cur * 100 / cap)
    if sta:match("Charging") then
        power_status =  "<span color='#54a992'> ↑ "..battery.."% </span>"
    elseif sta:match("Discharging") then
        if tonumber(battery) < 10 then
            naughty.notify({ title      = "Battery Warning"
                            , text       = "Battery low! "..battery.."% left!"
                            , timeout    = 5
                            , position   = "top_right"
                            , fg         = beautiful.fg_focus
                            , bg         = beautiful.bg_focus
                            })
        end
        power_status = "<span color='#d94c3a'> ↓ "..battery.."% </span>"
    else
        power_status = "<span color='#eddbc3'> ↯ </span>"
    end
    battery_widget:set_markup(power_status)
    fcur:close()
    fcap:close()
    fsta:close()
end
battery_timer = timer({timeout = 1})
battery_timer:connect_signal("timeout", function() batteryInfo("BAT0") end)
battery_timer:start()

memwidget = awful.widget.graph()
memwidget:set_background_color("#00000044")
memwidget:set_width(25)
memwidget:set_color("#FFFF00")
vicious.register(memwidget, vicious.widgets.mem, "$1")

cpuwidget = awful.widget.graph()
cpuwidget:set_width(25)
cpuwidget:set_background_color("#00000044")
cpuwidget:set_color("#00FF00")
vicious.register(cpuwidget, vicious.widgets.cpu, "$1")


tempwidget = wibox.widget.textbox()
vicious.register(tempwidget, vicious.widgets.thermal, " $1°C", 2, { "coretemp.0", "core"} )
-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

--pomodoro wibox
pomowibox = awful.wibox({ position = "bottom", screen = 1, height=8})
pomowibox.visible = false
local pomodoro = awmodoro.new({
    minutes             = 25,
    do_notify           = true,
    active_bg_color     = '#313131',
    paused_bg_color     = '#7746D7',
    fg_color            = {type = "linear", from = {0,0}, to = {pomowibox.width, 0}, stops = {{0, "#AECF96"},{0.5, "#88A175"},{1, "#FF5656"}}},
    width               = pomowibox.width,
    height              = pomowibox.height,

    begin_callback = function()
        pomowibox.visible = true
    end,

    finish_callback = function()
        pomowibox.visible = false
        awful.util.spawn_with_shell("zenity --info --text='Pomodoro done.\n\nHAVE A BREAK!'")
    end})
pomowibox:set_widget(pomodoro)

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then
        right_layout:add(mytextclock)
        right_layout:add(battery_widget)
        right_layout:add(tempwidget)
        right_layout:add(cpuwidget)
        right_layout:add(memwidget)
        right_layout:add(wibox.widget.systray())
    end
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey, "Control" }, "p", function () pomodoro:toggle() end),
    awful.key({ modkey, "Shift" }, "p", function () pomodoro:finish() end),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Up",  function () awful.util.spawn("/home/michal/.local/bin/pavol plus") end),
    awful.key({ }, "XF86AudioRaiseVolume", function () awful.util.spawn("/home/michal/.local/bin/pavol plus") end),
    awful.key({ modkey,           }, "Down",  function () awful.util.spawn("/home/michal/.local/bin/pavol minus") end),
    awful.key({ }, "XF86AudioLowerVolume", function () awful.util.spawn("/home/michal/.local/bin/pavol minus") end),
    awful.key({ modkey,           }, ".",  function () awful.util.spawn("/home/michal/.local/bin/pavol mute") end),
    awful.key({ }, "XF86AudioMute", function () awful.util.spawn("/home/michal/.local/bin/pavol mute") end),
    -- awful.key({ modkey,           }, "Escape", awful.tag.history.restore),
    awful.key({ modkey,           }, "Escape", function()
        awful.menu.menu_keys.down = { "Down", "Alt_L" }
        local cmenu = awful.menu.clients({width=460}, { keygrabber=true })
    end),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end),
    -- Brightness
    awful.key({ }, "XF86MonBrightnessDown", function () awful.util.spawn("xbacklight -dec 15") end),
    awful.key({ }, "XF86MonBrightnessUp", function () awful.util.spawn("xbacklight -inc 15") end),
    awful.key({ modkey }, "`", function () awful.util.spawn("xscreensaver-command -lock") end),
    awful.key({ modkey, "Control" }, "`", function () awful.util.spawn("sudo pm-suspend-hybrid ; xscreensaver-command -lock") end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey, }, "F4", function (c) c:kill()                         end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.movetotag(tag)
                          end
                     end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.toggletag(tag)
                          end
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- buttons for the titlebar
        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                )

        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))
        left_layout:buttons(buttons)

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- {{ Autostart
function run_once(prg,arg_string,pname,screen)
    if not prg then
        do return nil end
    end

    if not pname then
       pname = prg
    end

    if not arg_string then
        awful.util.spawn_with_shell("pgrep -f -u $USER -x '" .. pname .. "' || (" .. prg .. ")",screen)
    else
        awful.util.spawn_with_shell("pgrep -f -u $USER -x '" .. pname .. " ".. arg_string .."' || (" .. prg .. " " .. arg_string .. ")",screen)
    end
end
awful.util.spawn_with_shell(run_once("redshift-gtk", "-l 50.061389:19.938333", "python2 /usr/bin/redshift-gtk"))
awful.util.spawn_with_shell(run_once("nitrogen", "--restore"))
awful.util.spawn_with_shell(run_once("setxkbmap", "pl -option caps:ctrl_modifier"))
awful.util.spawn_with_shell(run_once("wicd-gtk", nil, "/usr/bin/python2 -O /usr/share/wicd/gtk/wicd-client.py"))
awful.util.spawn_with_shell(run_once("enable_two_fingers_scroll.sh"))
awful.util.spawn_with_shell(run_once("xscreensaver"))
awful.util.spawn_with_shell(run_once("pasystray"))
awful.util.spawn_with_shell(run_once("xcompmgr", "-CcFf"))
-- }}
