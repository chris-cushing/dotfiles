#!/bin/bash

yay -S --noconfirm --needed \
  wget `: # cli downloader` \              
  curl `: # cli web utility` \              
  unzip `: # file compression ` \             
  inetutils `: # gnu network utilties` \         
  fd `: # find alternative` \                
  eza `: # ls alternative` \               
  fzf `: # fast fuzzy finder` \               
  ripgrep `: # better grep` \           
  bat `: # better cat` \               
  jq `: # json parser cli utility ` \                
  xmlstarlet `: # xml cli utility` \        
  wl-clipboard `: # clipboard utility` \      
  btop `: # cpu and memory monitor` \              
  man `: # manual pages` \               
  tldr `: # short form man pages` \              
  less `: # the original more replacement` \              
  whois `: # lightweight DNS utility` \             
  plocate `: # a better locate` \           
  bash-completion `: # bash helper TODO do I need this in my current setup` \   
  oh-my-posh `: # make the prompt awesome` \        
  zsh `# a shell replacement, better than bash`

chsh -s $(which zsh)

if [[ "$CHEZMOI_TYPE" == "desktop"]]; then
  yay -S --noconfirm --needed \
    fastfetch `: # TUI description of the system` \ 
    ghostty `: # Terminal emulator` \   
    impala  `: # Data analysis, needed?`
fi
    
