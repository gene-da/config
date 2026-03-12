return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    --------------------------------------------------
    -- HEADER (Your ASCII)
    --------------------------------------------------

    dashboard.section.header.val = {
      ' @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ',
      ' @                                                                            @ ',
      ' @                                                                            @ ',
      ' @                                                                            @ ',
      ' @    ====               ===               ===               ====             @ ',
      ' @   +====              == ==             == ==              =====            @ ',
      ' @   ==  =             === ==             ==  ==             =  ==            @ ',
      ' @   ==  ==            ==   =             =   ==            ==  ==            @ ',
      ' @  ==    =            ==   ==           ==   ==            =    ==           @ ',
      ' @  ==    =           ==    ==           ==    ==           =    ==           @ ',
      ' @  ==    ==          ==     =           =     ==          ==    ==           @ ',
      ' @ ==      =          ==     =           =     ==          =      ==          @ ',
      ' @ ==      =          =      ==         ==      =          =      ==          @ ',
      ' @ ==      ==         =       =         =       =         ==      ==          @ ',
      ' @ ==       =        ==       =         =       ==        ==      ==          @ ',
      ' @==@  @  @@= @   @  == @   @ =@      @@=@   @  += @   @  =@ @   @ =@@  @  @  @ ',
      ' @  @  @@ @@=@@  @@ @=  @@ @@ ==@ @@ @@==@@ @@ @@= @@ @@ @=@ @@  @ =@@ @@  @@ @ ',
      ' @          ==       =         =       =         =       ==        ==       =-@ ',
      ' @          ==      ==         =       =         ==      =+         =      == @ ',
      ' @          ==      ==         ==     ==          =      ==         =      == @ ',
      ' @           ==     =          ==     ==          =     ==          ==     == @ ',
      ' @           ==     =          ==     =           =-    ==          ==    === @ ',
      ' @           ==    ==           ==    =           ==    ==           =    ==  @ ',
      ' @           ===   =            ==   ==            =    ==           ==   ==  @ ',
      ' @            ==  ==            ==   ==            =+  ==            ==  ===  @ ',
      ' @            ==  ==             == ==             ==  ==             =  ==   @ ',
      ' @             ==+=              == ==              ====              == ==   @ ',
      ' @             ====               ===               +===               ===    @ ',
      ' @                                                                            @ ',
      ' @                                                                            @ ',
      ' @                                                                            @ ',
      ' @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ',
    }
    --------------------------------------------------
    -- BUTTONS
    --------------------------------------------------

    dashboard.section.buttons.val = {

      dashboard.button('c', '  Config', ':cd ~/.config | Oil .<CR>'),

      dashboard.button('s', '󰒋  SME Repo', ':cd /mnt/c/Users/eugene.dann/Documents/SME/sme-repository | Oil .<CR>'),

      dashboard.button('p', '󱓞  Scripts', ':cd /mnt/c/Users/eugene.dann/Documents/SME/scripts | Oil .<CR>'),

      dashboard.button('n', '⚓  Navy-RRL', ':cd /mnt/c/Users/eugene.dann/Documents/SME/navy-rrl | Oil .<CR>'),

      dashboard.button('d', '󰆼  RRL-3D', ':cd /mnt/c/Users/eugene.dann/Documents/SME/rrl-3d | Oil .<CR>'),

      dashboard.button('r', '  Recent Files', ':Telescope oldfiles<CR>'),

      dashboard.button('f', '󰱼  Find File', ':Telescope find_files<CR>'),

      dashboard.button('q', '󰅚  Quit', ':qa<CR>'),
    }

    --------------------------------------------------

    alpha.setup(dashboard.opts)
  end,
}
