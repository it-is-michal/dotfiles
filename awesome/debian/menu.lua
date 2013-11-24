-- automatically generated file. Do not edit (see /usr/share/doc/menu/html)

module("debian.menu")

Debian_menu = {}

Debian_menu["Debian_Aplikacje_Biuro"] = {
	{"LibreOffice Calc","/usr/bin/libreoffice --calc","/usr/share/icons/hicolor/32x32/apps/libreoffice-calc.xpm"},
	{"LibreOffice Impress","/usr/bin/libreoffice --impress","/usr/share/icons/hicolor/32x32/apps/libreoffice-impress.xpm"},
	{"LibreOffice Writer","/usr/bin/libreoffice --writer","/usr/share/icons/hicolor/32x32/apps/libreoffice-writer.xpm"},
}
Debian_menu["Debian_Aplikacje_Dostępność"] = {
	{"Xmag","xmag"},
}
Debian_menu["Debian_Aplikacje_Dźwięk"] = {
	{"pavucontrol","/usr/bin/pavucontrol"},
}
Debian_menu["Debian_Aplikacje_Edytory"] = {
	{"Emacs 23 (text)", "x-terminal-emulator -e ".."/usr/bin/emacs23 -nw"},
	{"Emacs 23 (X11)","/usr/bin/emacs23"},
	{"Gedit","/usr/bin/gedit","/usr/share/pixmaps/gedit-icon.xpm"},
	{"GVIM","/usr/bin/vim.gtk -g -f","/usr/share/pixmaps/vim-32.xpm"},
	{"Nano", "x-terminal-emulator -e ".."/bin/nano","/usr/share/nano/nano-menu.xpm"},
	{"Xedit","xedit"},
	{"xpad","/usr/bin/xpad","/usr/share/pixmaps/xpad.xpm"},
}
Debian_menu["Debian_Aplikacje_Emulatory_terminala"] = {
	{"Gnome Terminal","/usr/bin/gnome-terminal","/usr/share/pixmaps/gnome-terminal.xpm"},
	{"XTerm","xterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
	{"XTerm (Unicode)","uxterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
	{"YaKuake","/usr/bin/yakuake"},
}
Debian_menu["Debian_Aplikacje_Grafika"] = {
	{"ImageMagick","/usr/bin/display.im6 logo:","/usr/share/pixmaps/display.im6.xpm"},
	{"Inkscape","/usr/bin/inkscape","/usr/share/pixmaps/inkscape.xpm"},
	{"LibreOffice Draw","/usr/bin/libreoffice --draw","/usr/share/icons/hicolor/32x32/apps/libreoffice-draw.xpm"},
	{"The GIMP","/usr/bin/gimp","/usr/share/pixmaps/gimp.xpm"},
	{"X Window Snapshot","xwd | xwud"},
}
Debian_menu["Debian_Aplikacje_Nauki_ścisłe_Matematyka"] = {
	{"Bc", "x-terminal-emulator -e ".."/usr/bin/bc"},
	{"Dc", "x-terminal-emulator -e ".."/usr/bin/dc"},
	{"LibreOffice Math","/usr/bin/libreoffice --math","/usr/share/icons/hicolor/32x32/apps/libreoffice-math.xpm"},
	{"Xcalc","xcalc"},
}
Debian_menu["Debian_Aplikacje_Nauki_ścisłe"] = {
	{ "Matematyka", Debian_menu["Debian_Aplikacje_Nauki_ścisłe_Matematyka"] },
}
Debian_menu["Debian_Aplikacje_Powłoki"] = {
	{"Bash", "x-terminal-emulator -e ".."/bin/bash --login"},
	{"Dash", "x-terminal-emulator -e ".."/bin/dash -i"},
	{"fish", "x-terminal-emulator -e ".."/usr/bin/fish"},
	{"Sh", "x-terminal-emulator -e ".."/bin/sh --login"},
	{"Zsh", "x-terminal-emulator -e ".."/bin/zsh5"},
}
Debian_menu["Debian_Aplikacje_Programowanie"] = {
	{"Cola","/usr/bin/git-cola"},
	{"GDB", "x-terminal-emulator -e ".."/usr/bin/gdb"},
	{"Meld","/usr/bin/meld"},
	{"Python (v2.7)", "x-terminal-emulator -e ".."/usr/bin/python2.7","/usr/share/pixmaps/python2.7.xpm"},
	{"Python (v3.3)", "x-terminal-emulator -e ".."/usr/bin/python3.3","/usr/share/pixmaps/python3.3.xpm"},
	{"Ruby (irb1.8)", "x-terminal-emulator -e ".."/usr/bin/irb1.8"},
	{"Ruby (irb1.9.1)", "x-terminal-emulator -e ".."/usr/bin/irb1.9.1"},
	{"Tclsh8.5", "x-terminal-emulator -e ".."/usr/bin/tclsh8.5"},
	{"TkWish8.5","x-terminal-emulator -e /usr/bin/wish8.5"},
}
Debian_menu["Debian_Aplikacje_Przeglądarki"] = {
	{"Evince","/usr/bin/evince","/usr/share/pixmaps/evince.xpm"},
	{"Eye of GNOME","/usr/bin/eog","/usr/share/pixmaps/gnome-eog.xpm"},
	{"ScreenRuler","/usr/bin/screenruler","/usr/share/pixmaps/screenruler.xpm"},
	{"Shotwell","/usr/bin/shotwell"},
	{"Xditview","xditview"},
	{"XDvi","/usr/bin/xdvi"},
}
Debian_menu["Debian_Aplikacje_Sieć_Komunikacja"] = {
	{"Claws Mail","/usr/bin/claws-mail","/usr/share/pixmaps/claws-mail-32x32.xpm"},
	{"Gajim","/usr/bin/gajim","/usr/share/pixmaps/gajim.xpm"},
	{"heirloom-mailx", "x-terminal-emulator -e ".."/usr/bin/heirloom-mailx"},
	{"Pidgin","/usr/bin/pidgin","/usr/share/pixmaps/pidgin-menu.xpm"},
	{"Remmina","/usr/bin/remmina"},
	{"Telnet", "x-terminal-emulator -e ".."/usr/bin/telnet"},
	{"Xbiff","xbiff"},
	{"X Chat","/usr/bin/xchat","/usr/share/icons/xchat.xpm"},
}
Debian_menu["Debian_Aplikacje_Sieć_Przeglądanie_WWW"] = {
	{"Google Chrome","/opt/google/chrome/google-chrome","/opt/google/chrome/product_logo_32.xpm"},
	{"w3m", "x-terminal-emulator -e ".."/usr/bin/w3m /usr/share/doc/w3m/MANUAL.html"},
}
Debian_menu["Debian_Aplikacje_Sieć_Przesyłanie_plików"] = {
	{"Transmission BitTorrent Client (GTK)","/usr/bin/transmission-gtk","/usr/share/pixmaps/transmission.xpm"},
}
Debian_menu["Debian_Aplikacje_Sieć"] = {
	{ "Komunikacja", Debian_menu["Debian_Aplikacje_Sieć_Komunikacja"] },
	{ "Przeglądanie WWW", Debian_menu["Debian_Aplikacje_Sieć_Przeglądanie_WWW"] },
	{ "Przesyłanie plików", Debian_menu["Debian_Aplikacje_Sieć_Przesyłanie_plików"] },
}
Debian_menu["Debian_Aplikacje_Systemowe_Administracja"] = {
	{"DSL/PPPoE configuration tool", "x-terminal-emulator -e ".."/usr/sbin/pppoeconf","/usr/share/pixmaps/pppoeconf.xpm"},
	{"Editres","editres"},
	{"Gnome Control Center","/usr/bin/gnome-control-center",},
	{"GNOME partition editor","su-to-root -X -c /usr/sbin/gparted","/usr/share/pixmaps/gparted.xpm"},
	{"nitrogen","/usr/bin/nitrogen"},
	{"pppconfig", "x-terminal-emulator -e ".."su-to-root -p root -c /usr/sbin/pppconfig"},
	{"TeXconfig", "x-terminal-emulator -e ".."/usr/bin/texconfig"},
	{"Xclipboard","xclipboard"},
	{"Xfontsel","xfontsel"},
	{"Xkill","xkill"},
	{"Xrefresh","xrefresh"},
}
Debian_menu["Debian_Aplikacje_Systemowe_Bezpieczeństwo"] = {
	{"Seahorse","/usr/bin/seahorse","/usr/share/pixmaps/seahorse.xpm"},
}
Debian_menu["Debian_Aplikacje_Systemowe_Monitorowanie"] = {
	{"GNOME system monitor","/usr/bin/gnome-system-monitor"},
	{"htop", "x-terminal-emulator -e ".."/usr/bin/htop"},
	{"Pstree", "x-terminal-emulator -e ".."/usr/bin/pstree.x11","/usr/share/pixmaps/pstree16.xpm"},
	{"Top", "x-terminal-emulator -e ".."/usr/bin/top"},
	{"Xconsole","xconsole -file /dev/xconsole"},
	{"Xev","x-terminal-emulator -e xev"},
	{"Xload","xload"},
}
Debian_menu["Debian_Aplikacje_Systemowe_Sprzęt"] = {
	{"ARandR","arandr"},
	{"Xvidtune","xvidtune"},
}
Debian_menu["Debian_Aplikacje_Systemowe_Ustawienia_języka"] = {
	{"Input Method Configuration", "x-terminal-emulator -e ".."/usr/bin/im-config"},
}
Debian_menu["Debian_Aplikacje_Systemowe_Zarządzanie_pakietami"] = {
	{"Aptitude Package Manager (text)", "x-terminal-emulator -e ".."/usr/bin/aptitude-curses"},
	{"Synaptic Package Manager","x-terminal-emulator -e synaptic-pkexec","/usr/share/synaptic/pixmaps/synaptic_32x32.xpm"},
}
Debian_menu["Debian_Aplikacje_Systemowe"] = {
	{ "Administracja", Debian_menu["Debian_Aplikacje_Systemowe_Administracja"] },
	{ "Bezpieczeństwo", Debian_menu["Debian_Aplikacje_Systemowe_Bezpieczeństwo"] },
	{ "Monitorowanie", Debian_menu["Debian_Aplikacje_Systemowe_Monitorowanie"] },
	{ "Sprzęt", Debian_menu["Debian_Aplikacje_Systemowe_Sprzęt"] },
	{ "Ustawienia języka", Debian_menu["Debian_Aplikacje_Systemowe_Ustawienia_języka"] },
	{ "Zarządzanie pakietami", Debian_menu["Debian_Aplikacje_Systemowe_Zarządzanie_pakietami"] },
}
Debian_menu["Debian_Aplikacje_Tekst"] = {
	{"Character map","/usr/bin/gucharmap"},
}
Debian_menu["Debian_Aplikacje_Video"] = {
	{"Totem","/usr/bin/totem","/usr/share/pixmaps/totem.xpm"},
	{"VLC media player","/usr/bin/qvlc","/usr/share/icons/hicolor/32x32/apps/vlc.xpm"},
}
Debian_menu["Debian_Aplikacje_Zarządzanie_plikami"] = {
	{"Baobab","/usr/bin/baobab","/usr/share/pixmaps/baobab.xpm"},
	{"Brasero","/usr/bin/brasero"},
	{"File-Roller","/usr/bin/file-roller","/usr/share/pixmaps/file-roller.xpm"},
	{"mc", "x-terminal-emulator -e ".."/usr/bin/mc","/usr/share/pixmaps/mc.xpm"},
	{"Nautilus","/usr/bin/nautilus","/usr/share/pixmaps/nautilus.xpm"},
}
Debian_menu["Debian_Aplikacje"] = {
	{ "Biuro", Debian_menu["Debian_Aplikacje_Biuro"] },
	{ "Dostępność", Debian_menu["Debian_Aplikacje_Dostępność"] },
	{ "Dźwięk", Debian_menu["Debian_Aplikacje_Dźwięk"] },
	{ "Edytory", Debian_menu["Debian_Aplikacje_Edytory"] },
	{ "Emulatory terminala", Debian_menu["Debian_Aplikacje_Emulatory_terminala"] },
	{ "Grafika", Debian_menu["Debian_Aplikacje_Grafika"] },
	{ "Nauki ścisłe", Debian_menu["Debian_Aplikacje_Nauki_ścisłe"] },
	{ "Powłoki", Debian_menu["Debian_Aplikacje_Powłoki"] },
	{ "Programowanie", Debian_menu["Debian_Aplikacje_Programowanie"] },
	{ "Przeglądarki", Debian_menu["Debian_Aplikacje_Przeglądarki"] },
	{ "Sieć", Debian_menu["Debian_Aplikacje_Sieć"] },
	{ "Systemowe", Debian_menu["Debian_Aplikacje_Systemowe"] },
	{ "Tekst", Debian_menu["Debian_Aplikacje_Tekst"] },
	{ "Video", Debian_menu["Debian_Aplikacje_Video"] },
	{ "Zarządzanie plikami", Debian_menu["Debian_Aplikacje_Zarządzanie_plikami"] },
}
Debian_menu["Debian_Ekran_Blokady"] = {
	{"Lock Screen (XScreenSaver)","/usr/bin/xscreensaver-command -lock"},
}
Debian_menu["Debian_Ekran_Wygaszacze"] = {
	{"Activate ScreenSaver (Next)","/usr/bin/xscreensaver-command -next"},
	{"Activate ScreenSaver (Previous)","/usr/bin/xscreensaver-command -prev"},
	{"Activate ScreenSaver (Random)","/usr/bin/xscreensaver-command -activate"},
	{"Demo Screen Hacks","/usr/bin/xscreensaver-command -demo"},
	{"Disable XScreenSaver","/usr/bin/xscreensaver-command -exit"},
	{"Enable XScreenSaver","/usr/bin/xscreensaver"},
	{"Reinitialize XScreenSaver","/usr/bin/xscreensaver-command -restart"},
	{"ScreenSaver Preferences","/usr/bin/xscreensaver-command -prefs"},
}
Debian_menu["Debian_Ekran"] = {
	{ "Blokady", Debian_menu["Debian_Ekran_Blokady"] },
	{ "Wygaszacze", Debian_menu["Debian_Ekran_Wygaszacze"] },
}
Debian_menu["Debian_Gry_Karciane"] = {
	{"Gnome Solitaire Games","/usr/games/sol","/usr/share/pixmaps/aisleriot.xpm"},
}
Debian_menu["Debian_Gry_Zabawki"] = {
	{"Oclock","oclock"},
	{"Redshift","gtk-redshift"},
	{"Xclock (analog)","xclock -analog"},
	{"Xclock (digital)","xclock -digital -update 1"},
	{"Xeyes","xeyes"},
	{"Xlogo","xlogo"},
}
Debian_menu["Debian_Gry"] = {
	{ "Karciane", Debian_menu["Debian_Gry_Karciane"] },
	{ "Zabawki", Debian_menu["Debian_Gry_Zabawki"] },
}
Debian_menu["Debian_Pomoc"] = {
	{"Info", "x-terminal-emulator -e ".."info"},
	{"TeXdoctk","/usr/bin/texdoctk"},
	{"Xman","xman"},
	{"yelp","/usr/bin/yelp"},
}
Debian_menu["Debian"] = {
	{ "Aplikacje", Debian_menu["Debian_Aplikacje"] },
	{ "Ekran", Debian_menu["Debian_Ekran"] },
	{ "Gry", Debian_menu["Debian_Gry"] },
	{ "Pomoc", Debian_menu["Debian_Pomoc"] },
}
