Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
}

class users {
  user { "baphled":
    ensure => present,
    shell => "/bin/bash",
    managehome => true
  }
}

# setup a common workspace
node 'workspace' {
  include users
  include rvm

  # Make sure apt-get update has been run
  exec { "apt-get update":
    command => "/usr/bin/apt-get update",
    onlyif => "/bin/sh -c '[ ! -f /var/cache/apt/pkgcache.bin ] || /usr/bin/find /etc/apt/* -cnewer /var/cache/apt/pkgcache.bin | /bin/grep . > /dev/null'",
  }

  if $rvm_installed == 'true' {
    rvm::system_user { baphled: ; }

    rvm_system_ruby {
      'ruby-1.9.3':
        ensure => 'present',
        require  => Exec['apt-get update'],
        default_use => true;
    }

    rvm_gemset {
      "ruby-1.9.3@global":
        ensure => present,
        require => Rvm_system_ruby['ruby-1.9.3'];
    }

    rvm_gem {
      'bundler':
        name => 'bundler',
        ruby_version => 'ruby-1.9.3',
        ensure => latest,
        require => Rvm_system_ruby['ruby-1.9.3']
    }
  }

  # Install dotfiles for myself
  # recursively init and update repositories
}
