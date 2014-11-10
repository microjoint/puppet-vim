#
class vim (
  $config = $vim::params::config
) inherits vim::params {

  include '::vim::install'
  include '::vim::config'

  Class['::vim::install'] -> Class['::vim::config']
}
