#
class vim::install inherits vim {

  $defaults = {
    ensure => latest
  }

  create_resources( package, $package, $defaults )

}
