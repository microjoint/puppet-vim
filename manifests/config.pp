# 
class vim::config inherits vim {

  if $config {
    create_resources( file, $config )
  }
}
