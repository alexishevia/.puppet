class git_config {

  file { "/home/$id/.gitconfig":
    owner => "$id",
    group => "$id",
    mode => "644",
    source => "puppet:///modules/git_config/.gitconfig",
  }

}
