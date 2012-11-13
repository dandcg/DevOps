class dotfiles {

  $git =  "/usr/bin/git"

  # Install dotfiles for myself
  
  vcsrepo { "/home/baphled":
    source => "git://github.com/baphled/dotfiles.git",
    revision => 'origin/puppet',
    ensure => latest,
    provider => git,
    owner => baphled,
    group => baphled,
    force => true,
  }

  # recursively init and update repositories
  # TODO: This should be a dotfiles script

  # patch font 
  # TODO: Determine whether this is actually needed
}
