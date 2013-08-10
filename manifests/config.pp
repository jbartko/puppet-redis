#
class redis::config {
  exec { 'make install':
    cwd         => "/home/${redis::user}/source",
    path        => [ '/bin', '/usr/bin' ],
    refreshonly => true,
  }

#  file { '/etc/redis.conf':
#    ensure  => present,
#    content => template('redis/redis.conf.erb'),
#  }

  concat { $redis::file_conf: }
  Concat::Fragment <<| target == "${::fqdn}_${redis::file_conf}" |>>

  if $redis::default_instance {
    redis::instance { 'default': }
  } else {
  }
}

# vim: set ts=2 sw=2 et ft=puppet:
