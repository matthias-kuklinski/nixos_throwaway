{
  programs.zsh = {
    enable = true;
    syntaxHighlighting = {
      enable = true;
    };
    autocd = true;
    dotDir = ".config/zsh";
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = {
      a = "aws";
      b = "btm";
      c = "clear";
      d = "docker";
      e = "eza";
      f = "fzf";
      g = "git";
      k = "kubectl";
      l = "ls -Ahl --color=auto";
      n = "nvim";
      r = "rg";
      t = "terraform";
      x = "exit";
    };
    envExtra = "export ZDOTDIR=~/.config/zsh";
    history = {
      save = 100000;
      size = 100000;
      share = true;
    };
    initExtra = ''
      # Settings
      unsetopt beep           # Do not beep on erros.

      # Key-Bindings
      bindkey -v '^?' backward-delete-char # Enable vi-mode and fix backspace-bug after leaving insert mode.
      KEYTIMEOUT=1

      # Vi-mode
      function zle-keymap-select () {
        case $KEYMAP in
          vicmd) echo -ne '\e[1 q';;      # Display a block-shaped cursor.
          viins|main) echo -ne '\e[5 q';; # Display a beam-shaped cursor.
        esac
      }
      zle -N zle-keymap-select

      zle-line-init() { echo -ne '\e[5 q' }
      zle -N zle-line-init

      echo -ne '\e[5 q' # Display a beam-shaped cursor on startup.
      preexec() { echo -ne '\e[5 q' } # Display a beam-shaped cursor for each new prompt.
    '';
  };
}
