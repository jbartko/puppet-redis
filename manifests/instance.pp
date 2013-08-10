#
class redis::instance(

) inherits redis::instance::params {
  if ! defined(Class['redis']) { fail('You must include Class[\'redis\']!') }

  file { "/etc/redis.d/${name}.conf":
    ensure  => present,
    content => template('redis/default.conf.erb'),
  }

}

# vim: set sw=2 ts=2 et ft=puppet:
