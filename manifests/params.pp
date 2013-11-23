#
class redis::params {
  $default_instance = true
  $dir_conf         = '/etc/redis.d'
  $dir_lib          = '/var/lib/redis'
  $dir_log          = '/var/log/redis'
  $dir_run          = '/var/run/redis'
  $file_conf        = '/etc/redis.conf'
  $file_init        = '/etc/init.d/redis'
  $user             = 'redis'
  $version          = '2.8'
}

# vim: set ts=2 sw=2 et ft=puppet:
