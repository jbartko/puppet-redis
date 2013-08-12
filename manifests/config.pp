#
class redis::config {
  exec { 'make install':
    cwd         => "/home/${redis::user}/source",
    path        => [ '/bin', '/usr/bin' ],
    refreshonly => true,
  }

  if $redis::default_instance { @redis::instance { 'default': } }

  Redis::Instance <||>
}

# vim: set ts=2 sw=2 et ft=puppet:
