#
class redis::install {
  user { $redis::user:
    ensure     => present,
    managehome => true,
    shell      => '/sbin/nologin',
    system     => true,
  }

  file { '/etc/redis.d':
    ensure => directory,
  }

  include git

  vcsrepo { 'source':
    ensure   => latest,
    path     => "/home/${redis::user}/source",
    notify   => Exec['make'],
    provider => 'git',
    source   => 'https://github.com/antirez/redis.git',
    revision => $redis::version,
  }

  exec { 'make':
    cwd         => "/home/${redis::user}/source",
    notify      => Exec['make install'],
    path        => [ '/bin', '/usr/bin' ],
    refreshonly => true,
  }
}

# vim: set ts=2 sw=2 et ft=puppet:
