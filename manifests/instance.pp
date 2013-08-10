#
class redis::instance(

) inherits redis::instance::params {
  if ! defined(Class['redis']) { fail('You must include Class[\'redis\']!') }
}

# vim: set sw=2 ts=2 et ft=puppet:
