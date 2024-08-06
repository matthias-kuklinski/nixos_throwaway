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

    userEmail = "contact@matthias-kuklinski.com";
    userName = "Matthias Kuklinski";

    includes = [
      {
        condition = "gitdir:~/engineering/work/glueckkanja/";
        contents = {
          user = {
            email = "matthias.kuklinski@glueckkanja.com";
          };
        };
      }
    ];
  };
}
