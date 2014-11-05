class vim::params {
  $config 	= undef
  $global_vimrc = '/etc/vim/vimrc'
  
  case $::osfamily {
    'Debian': {
      $package = {
        'vim' => {},
        }
    }
    'Archlinux': {
      $package = {
        'vim' => {},
        'vim-colorsamplerpack' => {}
      }
    }
    'Linux': {
      case $::operatingsystem {
        default: {
          fail("The ${module_name} module is not supported on an ${::operatingsystem} distribution.")
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
