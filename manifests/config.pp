class vim::config inherits vim {
  $file_defaults = {
    owner => root,
    group => root,
    mode  => '0644',
  }

  file {'/etc/vimrc':
    ensure  => present,
    content  => template("vim/vimrc.erb"),
  }

  file { "$config_path/bundle":
    ensure   => directory,
    source   => "puppet:///modules/vim/bundle",
    recurse  => remote,
  }

  exec { "vim +PluginInstall +qall":
    subscribe   => File['/etc/vimrc'],
    refreshonly => true,
    path        => ["/usr/bin"]
  }
}
