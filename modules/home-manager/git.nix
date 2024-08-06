{
  programs.git = {
    enable = true;

    extraConfig = {
      color.ui = true;
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };

    signing = {
      key = "0x597496DD4FB82D2C";
      signByDefault = true;
    };

    # userEmail = "contact@matthias-kuklinski.com";
    userName = "Matthias Kuklinski";

    includes = [
      {
        path = "/home/matthias/.gitconfig-personal";
        condition = "gitdir:home/matthias/engineering/";
      }
      {
        path = "/home/matthias/.gitconfig-work-glueckkanja";
        condition = "gitdir:home/matthias/engineering/work/glueckkanja";
      }
    ]
    };
  };
}
