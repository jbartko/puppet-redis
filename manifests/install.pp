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
    provider => 'git',
    source   => 'https://github.com/antirez/redis.git',
    revision => '2.6',
  }
}

# vim: set ts=2 sw=2 et ft=puppet:
