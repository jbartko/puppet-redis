#
class redis::install {
  user { $redis::user:
    ensure     => present,
    managehome => true,
    shell      => '/sbin/nologin',
    system     => true,
  }

  include git

  vcsrepo { "/home/${redis::user}/redis":
    ensure   => present,
    provider => 'git',
    source   => 'git@github.com:antirez/redis.git',
    revision => '2.6',
    user     => $redis::user,
  }
}

# vim: set ts=2 sw=2 et ft=puppet:
