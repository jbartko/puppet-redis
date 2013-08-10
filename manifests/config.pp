#
class redis::config {
  exec { 'make install':
    cwd         => "/home/${redis::user}/source",
    path        => [ '/bin', '/usr/bin' ],
    refreshonly => true,
  }

  file { '/etc/redis.conf':
    ensure  => present,
    content => template('redis/redis.conf.erb'),
  }

  file { '/etc/redis.d/default.conf':
    ensure  => present,
    content => template('redis/default.conf.erb'),
  }
}

# vim: set ts=2 sw=2 et ft=puppet:
