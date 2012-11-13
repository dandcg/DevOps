Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
}

node base {
  include users
  include users::ssh
  include zsh
}

# setup a common workspace
node 'workspace' inherits base {
  include rvm
  include tmux
  include vim
  include dotfiles

  # Make sure apt-get update has been run
  # FIXME: This isn't being run for some reason
  # Should run `apt-get update` manually for now
  exec {
    "apt-get update":
      command => "/usr/bin/apt-get update",
  }

  if $rvm_installed == 'true' {
    rvm::system_user { baphled: ; }

    # Don't set this to default as puppet will not be found when you try to
    # provision for the 2nd time.
    rvm_system_ruby {
      'ruby-1.9.3':
        ensure => present,
        require  => Exec['apt-get update'],
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
}
