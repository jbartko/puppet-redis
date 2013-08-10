#
define redis::instance {
  if ! defined(Class['redis']) { fail('You must include Class[\'redis\']!') }

  file { "/etc/redis.d/${name}.conf":
    ensure  => present,
    content => template('redis/default.conf.erb'),
  }

  @@concat::fragment { "instance_${name}":
    target  => '/etc/redis.conf',
    content => "include /etc/redis.d/${name}.conf\n",
  }

}

# vim: set sw=2 ts=2 et ft=puppet:
