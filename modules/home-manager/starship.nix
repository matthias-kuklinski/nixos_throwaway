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
          "$name"
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
          "$subscription"
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
          "$profile"
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
      };
      "cmd_duration" = {
        "min_time" = 5000;
      };
      "username" = {
        "format" = "[$user](bold blue) on ";
      };
      "hostname" = {
	      "format" = "[$hostname](bold blue) in ";
      };
    };
  };
}
