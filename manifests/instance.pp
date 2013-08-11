#
define redis::instance (
  $port = '6379',
) {
  if ! defined(Class['redis']) { fail('You must include Class[\'redis\']!') }

  file { "/etc/redis.d/${port}.conf":
    ensure  => present,
    content => template('redis/instance.conf.erb'),
  }

  @concat::fragment { "redis_include_${port}":
    target  => $redis::file_conf,
    content => "include /etc/redis.d/${port}.conf\t\t# ${name}\n",
  }
}

# vim: set sw=2 ts=2 et ft=puppet:
