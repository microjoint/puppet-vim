#
class vim::install inherits vim {

  $defaults = {
    ensure => latest
  }

  create_resources( package, $package, $defaults )

  vcsrepo{ 'vimcolors':
    ensure   => latest,
    source   => 'https://github.com/flazz/vim-colorschemes.git',
    provider => git,
  }

  # sort out the vim colors, when we clone it already has a
  # 'colors' sub-directory

  exec{'move_vim_colors':
    path        => ['/usr/bin'],
    cwd         => '/usr/share/vim/vim74/colors',
    command     => 'rsync -a colors/ .',
    subscribe   => Vcsrepo['vimcolors'],
    refreshonly => true,
  }
}
