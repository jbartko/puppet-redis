#
class redis::config {
  exec { 'make install':
    cwd         => "/home/${redis::user}/source",
    path        => [ '/bin', '/usr/bin' ],
    refreshonly => true,
  }

  concat { $redis::file_conf: }
  concat::fragment { 'redis conf header':
    target => $redis::file_conf,
    content => "Managed by puppet\n\n",
    order   => '01',
  }
  Concat::Fragment <<| target == $redis::file_conf |>>

  if $redis::default_instance { redis::instance { 'default': } }
}

# vim: set ts=2 sw=2 et ft=puppet:
