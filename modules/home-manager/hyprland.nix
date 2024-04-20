{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      exec-once = fnott
      exec-once = swww init
      exec = swww clear 000000

      monitor = DP-3,2560x1440@144,0x0,1
      monitor = DP-1,2560x1440@144,2560x0,1
      monitor = DP-2,2560x1440@144,5120x0,1
      monitor = HDMI-A-1,2560x1440,7680x0,1

      input {
        kb_layout = us
        follow_mouse = 1
        sensitivity = 0
        force_no_accel = 1
        kb_options = caps:swapescape
      }

      general {
        gaps_in = 5
        gaps_out = 20
        border_size = 2
        col.active_border = rgba(1affffee)
        col.inactive_border = rgba(595959aa)

        layout = dwindle
      }

      decoration {
        rounding = 4
        drop_shadow = yes
        shadow_range = 4
        shadow_render_power = 3
        col.shadow = rgba(1a1a1aee)
      }

      animations {
        enabled = yes
        bezier = myBezier, 0.05, 0.9, 0.1, 1.05

        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
      }

      dwindle {
        pseudotile = yes
        preserve_split = yes
      }

      master {
        new_is_master = true
      }

      gestures {
        workspace_swipe = off
      }

      misc {
        disable_hyprland_logo = true
      }

      $mainMod = SUPER

      bind = $mainMod, b, exec, firefox
      bind = $mainMod, n, exec, foot
      bind = $mainMod, p, exec, keepassxc
      bind = $mainMod, s, exec, grim -g "$(slurp)" - | wl-copy -t image/png

      bind = $mainMod, q, killactive,
      bind = $mainMod, f, togglefloating,
      bind = $mainMod, O, togglesplit,

      bind = $mainMod, h, movefocus, l
      bind = $mainMod, l, movefocus, r
      bind = $mainMod, k, movefocus, u
      bind = $mainMod, j, movefocus, d

      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      bind = $mainMod SHIFT, h, movewindow, l
      bind = $mainMod SHIFT, l, movewindow, r
      bind = $mainMod SHIFT, k, movewindow, u
      bind = $mainMod SHIFT, j, movewindow, d

      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
    '';
  };
}
