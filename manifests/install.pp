class vim::install inherits vim {

  package { 'gvim':
    ensure => latest,
    require => Package['vim']
  }
  package { 'vim' : ensure => absent }
  package { 'vim-colorsamplerpack':
    ensure => latest,
    require => Package['gvim']
  }


}
