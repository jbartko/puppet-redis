#
define redis::instance (
  $port = $redis::instance::params::port,
) {
  include redis::instance::params
  if ! defined(Class['redis']) { fail('You must include Class[\'redis\']!') }

  file { "/etc/redis.d/${port}.conf":
    ensure  => present,
    content => template('redis/instance.conf.erb'),
  }

  @@concat::fragment { "instance_${port}":
    target  => "${::fqdn}_${redis::file_conf}",
    content => "include /etc/redis.d/${port}.conf\n",
  }

}

# vim: set sw=2 ts=2 et ft=puppet:
