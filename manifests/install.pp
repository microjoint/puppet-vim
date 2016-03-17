#
class vim::install inherits vim {

  $defaults = {
    ensure => latest
  }

  create_resources( package, $package, $defaults )

  vcsrepo{ '/usr/share/vim/vim74':
    ensure   => latest,
    force    => true,
    source   => 'https://github.com/flazz/vim-colorschemes.git',
    provider => git,
  }

  # sort out the vim colors, when we clone it already has a
  # 'colors' sub-directory

  file{ '/usr/share/vim/vim74/colors':
    ensure => link,
    target => '/usr/share/repo/colors/colors',
  }
}
