# Puppet for Docker Vagrant Box
node default {
    # apt
    class { 'apt': }
    
    apt::source { 'docker':
        location => "http://get.docker.io/ubuntu",
        key => "36A1D7869245C8950F966E92D8576A8BA88D21E9",
        release => "docker",
        repos => "main",
        include_src => false
    }

    package { 'raring-kernel':
        name => 'linux-image-generic-lts-raring',
        ensure => present
    }

    package { 'lxc-docker':
        require => [apt::source["docker"], Package["raring-kernel"]]
    }
}
