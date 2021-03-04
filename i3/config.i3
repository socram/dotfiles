# Configura master para tecla Super
set $super Mod4

# Configura fonte
font pango:monospace 10

# Use Mouse+$super to drag floating windows to their wanted position
floating_modifier $super

# Inicia junto com o sistema
# Wallpaper
exec --no-startup-id feh --randomize --bg-scale ~/.config/i3/wallpaper/*

# Inicia terminal
bindsym $super+Return exec i3-sensible-terminal

# Inicia rofi ( Procurar programas )
bindsym $super+d exec rofi -lines 12 -padding 18 -width 60 -location 0 -show drun -sidebar-mode -columns 3 -font 'Noto Sans 10'

# Muda foco VIM
bindsym $super+h focus left
bindsym $super+j focus down
bindsym $super+k focus up
bindsym $super+l focus right

# Muda foco SETAS
bindsym $super+Left  focus left
bindsym $super+Down  focus down
bindsym $super+Up    focus up
bindsym $super+Right focus right


# Abrir programas com combinacao de teclas
bindsym $super+Shift+g exec gedit

# Tirar print selecionando a area
bindsym $super+Shift+s exec gnome-screenshot -acf /tmp/test && cat /tmp/test | xclip -i -selection clipboard -target image/png

# Fechar janela em foto
bindsym $super+q kill

# Bloqueia a tela
# Criando imagem desfocada do papel de parede para bloquear a tela
# convert ${PICTURE} -blur "5x4" ${PICTURE}
bindsym $super+Shift+l exec i3lock -i /home/mconceicao/.config/i3/lock/lock.png


# Move foto
bindsym $super+Shift+Left move left
bindsym $super+Shift+Down move down
bindsym $super+Shift+Up move up
bindsym $super+Shift+Right move right


# Alterna para Full Screen
bindsym $super+f fullscreen toggle


# Alterna posicao na tela igual TMUX ( Ctrl+b + space )
bindsym $super+s layout toggle split

# Alterna flutuacao das janelas
bindsym $super+space floating toggle

# Define nome para workspaces
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# Troca entre workspaces
bindsym $super+1 workspace number $ws1
bindsym $super+2 workspace number $ws2
bindsym $super+3 workspace number $ws3
bindsym $super+4 workspace number $ws4
bindsym $super+5 workspace number $ws5
bindsym $super+6 workspace number $ws6
bindsym $super+7 workspace number $ws7
bindsym $super+8 workspace number $ws8
bindsym $super+9 workspace number $ws9
bindsym $super+0 workspace number $ws10

# Muda o foco para workspaces
bindsym $super+Shift+1 move container to workspace number $ws1
bindsym $super+Shift+2 move container to workspace number $ws2
bindsym $super+Shift+3 move container to workspace number $ws3
bindsym $super+Shift+4 move container to workspace number $ws4
bindsym $super+Shift+5 move container to workspace number $ws5
bindsym $super+Shift+6 move container to workspace number $ws6
bindsym $super+Shift+7 move container to workspace number $ws7
bindsym $super+Shift+8 move container to workspace number $ws8
bindsym $super+Shift+9 move container to workspace number $ws9
bindsym $super+Shift+0 move container to workspace number $ws10


# Reload arquivo de configuracao
bindsym $super+Shift+c reload
# Restart arquivo de configuracao
bindsym $super+Shift+r restart


mode "resize" {
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym semicolon resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}



##############################################
##    Configurei aqui aqui
##############################################


# panel
bar {
        colors {
        background #2f343f
        statusline #2f343f
        separator #4b5262

        # colour of border, background, and text
        focused_workspace       #2f343f #bf616a #d8dee8
        active_workspace        #2f343f #2f343f #d8dee8
        inactive_workspace      #2f343f #2f343f #d8dee8
        urgent_workspacei       #2f343f #ebcb8b #2f343f
    }
        status_command i3status
        position top
}

# window rules, you can find the window class using xprop
for_window [class=".*"] border pixel 4
assign [class=URxvt] 1
assign [class=Firefox|Transmission-gtk] 2
assign [class=Thunar|File-roller] 3
assign [class=Geany|Evince|Gucharmap|Soffice|libreoffice*] 4
assign [class=Audacity|Vlc|mpv|Ghb|Xfburn|Gimp*|Inkscape] 5
assign [class=Lxappearance|System-config-printer.py|Lxtask|GParted|Pavucontrol|Exo-helper*|Lxrandr|Arandr] 6
for_window [class=Viewnior|feh|Audacious|File-roller|Lxappearance|Lxtask|Pavucontrol] floating enable
for_window [class=URxvt|Firefox|Geany|Evince|Soffice|libreoffice*|mpv|Ghb|Xfburn|Gimp*|Inkscape|Vlc|Lxappearance|Audacity] focus
for_window [class=Xfburn|GParted|System-config-printer.py|Lxtask|Pavucontrol|Exo-helper*|Lxrandr|Arandr] focus

# colour of border, background, text, indicator, and child_border
client.focused              #bf616a #2f343f #d8dee8 #bf616a #d8dee8
client.focused_inactive     #2f343f #2f343f #d8dee8 #2f343f #2f343f
client.unfocused            #2f343f #2f343f #d8dee8 #2f343f #2f343f
client.urgent               #2f343f #2f343f #d8dee8 #2f343f #2f343f
client.placeholder          #2f343f #2f343f #d8dee8 #2f343f #2f343f
client.background           #2f343f

