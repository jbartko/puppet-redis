#
class redis::params {
  $default_instance = true
  $dir_conf         = '/etc/redis.d'
  $file_conf        = '/etc/redis.conf'
  $user             = 'redis'
  $version          = '2.6'
}

# vim: set ts=2 sw=2 et ft=puppet:
