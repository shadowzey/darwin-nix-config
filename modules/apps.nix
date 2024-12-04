{ pkgs, ...}: {

  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  #  NOTE: Your can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  #
  # TODO Fell free to modify this file to fit your needs.
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment.systemPackages = with pkgs; [
    git
    vim
    axel
    just
    devenv
  ];
  environment.variables.EDITOR = "nvim";

  # To make this work, homebrew need to be installed manually, see https://brew.sh
  #
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
      upgrade = true; # Upgrade outdated casks, formulae, and App Store apps
    };

    taps = [
      "homebrew/services"
    ];

    # `brew install`
    # TODO Feel free to add your favorite apps here.
    brews = [
      "wget" # download tool
      "curl" # no not install curl via nixpkgs, it's not working well on macOS!
      "aria2" # download tool
      "httpie" # http client
    ];

    masApps = {
      # Xcode = 497799835;
      # Wechat = 836500024;
      # QQ = 451108668;
      # WeCom = 1189898970; # Wechat for Work
      # TecentMeeting = 1484048379;
      # QQMusic = 595615424;
    };

    # `brew install --cask`
    # TODO Feel free to add your favorite apps here.
    casks = [
      "google-chrome"
      "iterm2"
      # "visual-studio-code" 重复构建有问题

      "telegram"
      "iina" # video player
      "raycast" # (HotKey: alt/option + space)search, caculate and run scripts(with many plugins)
      "stats" # beautiful system monitor
      "eudic" # 欧路词典

      # Development
      "insomnia" # REST client
      "wireshark" # network analyzer
      "chatbox" # chatgpt desktop client

      # 娱乐
      "neteasemusic"

      "microsoft-remote-desktop" # RDP client
      "tencent-meeting"
      "hiddenbar" # 菜单栏图标折叠
    ];
  };
}
