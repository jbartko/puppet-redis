#
class redis::config {
  file { '/etc/security/limits.d/redis.conf':
    ensure  => present,
    content => template('redis/limits.erb'),
  }

  if $redis::default_instance { @redis::instance { 'default': } }

  Redis::Instance <||>
}

# vim: set ts=2 sw=2 et ft=puppet:
