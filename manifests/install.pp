#
class redis::install {
  group { $redis::user:
    ensure => present,
    system => true,
  }

  user { $redis::user:
    ensure     => present,
    managehome => true,
    shell      => '/sbin/nologin',
    system     => true,
  }

  file {[ $redis::dir_conf, $redis::dir_lib, $redis::dir_log, $redis::dir_run ]:
    ensure => directory,
    owner  => 'root',
    group  => $redis::user,
    mode   => '0660'
  }

  file { $redis::file_init:
    ensure  => present,
    mode    => '0755',
    content => template('redis/sysv_init.erb'),
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
