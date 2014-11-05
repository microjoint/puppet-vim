class vim::config inherits vim {

  file {$global_vimrc:
    ensure  => present,
    source  => 'puppet:///modules/vim/vimrc'
  }

  if $config {
    create_resources( file, $config )
  }
}
