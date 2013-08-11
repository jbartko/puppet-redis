#
define redis::instance (
  $port = '6379',
) {
  if ! defined(Class['redis']) { fail('You must include Class[\'redis\']!') }

  file { "/etc/redis.d/${port}.conf":
    ensure  => present,
    content => template('redis/instance.conf.erb'),
  }
}

# vim: set sw=2 ts=2 et ft=puppet:
