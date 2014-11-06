class vim::config inherits vim {

  file {$global_vimrc:
    ensure  => file,
    source  => 'puppet:///modules/vim/vimrc'
  }

  if $config {
    create_resources( file, $config )
  }
}
