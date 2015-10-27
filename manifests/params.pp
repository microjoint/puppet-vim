#
class vim::params {
  $config   = undef

  case $::osfamily {
    'Debian': {
      $package = {
        'vim'        => {},
        'vim-gtk'    => {},
        'vim-puppet' => {},
        }
    }
    'Archlinux': {
      $package = {
        'vim'                  => {},
        'vim-colorsamplerpack' => {}
      }
    }
    'Linux': {
      case $::operatingsystem {
        default: {
          fail("The ${module_name} module is not supported on an \
          ${::operatingsystem} distribution.")
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an \
      ${::osfamily} based system.")
    }
  }
}
