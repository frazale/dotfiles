{ pkgs, ... }:
{
  home.packages = with pkgs; [
    odin
    ols
    nixd
    tombi
    just-lsp
    lua-language-server
    stylua
    ];
}
