class vim (
  $config 	= $vim::params::config,
  $global_vimrc = $vim::params::global_vimrc
) inherits vim::params {

  include '::vim::install'
  include '::vim::config'

  Class['::vim::install'] -> Class['::vim::config']
}
