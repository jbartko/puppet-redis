#
class redis::install {
  user { $redis::user:
    ensure     => present,
    managehome => true,
    shell      => '/sbin/nologin',
    system     => true,
  }

  include git

  vcsrepo { "/home/${redis::user}/source":
    ensure   => present,
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
