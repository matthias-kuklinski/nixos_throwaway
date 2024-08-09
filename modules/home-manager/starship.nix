{
  programs.starship = {
    enable = true;
    settings = {
      "nix_shell" = {
        "format" = "via [$symbol$state( \($name\))]($style)";
      };
      "add_newline" = false;
      "aws" = {
        "format" = "on [$symbol($profile )(\($region\) )]($style)";
        "disabled" = false;
        "symbol" = "☁️ ";
      };
      "azure" = {
        "symbol" = "󰠅 ";
        "disabled" = false;
      };
      "directory"= {
        "read_only"= " ";
        "style"= "bold blue";
        "truncate_to_repo"= false;
      };
      "git_branch"= {
        "style"= "bold blue";
        "symbol"= " ";
      };
      "git_status"= {
        "ahead"= "⇡\${count}";
        "behind"= "⇣\${count}";
        "deleted"= "-\${count}";
        "diverged"= "⇡\${ahead_count}⇣\${behind_count}";
        "modified"= "!\${count}";
        "staged"= "+\${count}";
        "style"= "bold red";
        "untracked"= "?\${count}";
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
