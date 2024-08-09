{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      nix_shell = {
        disabled = false;
        symbol = "❄️ ";
        pure_msg = "pure";
        impure_msg = "impure";
        unknown_msg = "unknown";
        heuristic = false;
        style = "blue bold";
        format = pkgs.lib.concatStrings [
          "| "
          "["
          "$symbol"
          "$name "
          "\\($state\\)"
          "]"
          "($style) "
        ];
      };
      azure = {
        disabled = false;
        symbol = "☁️ ";
        format = pkgs.lib.concatStrings [
          "| "
          "["
          "$symbol"
          "$subscription "
          "\\($username\\)"
          "]"
          "($style) "
        ];
      };
      aws = {
        disabled = false;
        symbol = "☁️ ";
        expiration_symbol = "X";
        force_display = true;
        style = "blue bold";
        format = pkgs.lib.concatStrings [
          "| "
          "["
          "$symbol"
          "$profile "
          "\\($region\\)"
          "]"
          "($style) "
        ];
      };
      directory = {
        disabled = false;
        home_symbol = "~";
        read_only = "🔒";
        style = "white bold";
        truncate_to_repo = false;
      };
      git_branch = {
        disabled = false;
        symbol = "🌱";
        style = "blue bold";
        format = pkgs.lib.concatStrings [
          "| "
          "["
          "$symbol "
          "$branch"
          "]"
          "($style) "
        ];
      };
      git_status = {
        ahead = "⇡\${count}";
        behind = "⇣\${count}";
        deleted = "-\${count}";
        diverged = "⇡\${ahead_count}⇣\${behind_count}";
        modified = "!\${count}";
        staged = "+\${count}";
        untracked = "?\${count}";
        style = "green bold";
        format = pkgs.lib.concatStrings [
          "["
          "$all_status"
          "$ahead_behind"
          "]"
          "($style) "
        ];
      };
      cmd_duration = {
        min_time = 2000;
        show_milliseconds = true;
        style = "white bold";
        show_notifications = true;
        min_time_to_notify = 5;
        format = pkgs.lib.concatStrings [
          "took"
          "["
          "$duration"
          "]"
          "$(style) "
        ];
      };
      hostname = {
        disabled = false;
        ssh_symbol = "🔑";
        ssh_only = true;
        style = "red bold";
	      format = pkgs.lib.concatStrings [
          "| "
          "["
          "$ssh_symbol "
          "$hostname"
          "]"
          "($style) "
        ];
      };
      username = {
        disabled = false;
        show_always = false;
        style_root = "red bold";
        style_user = "blue bold";
	      format = pkgs.lib.concatStrings [
          "| "
          "["
          "$user "
          "]"
          "($style) "
        ];
      };
    };
  };
}
