class g1337::shell($home_directory, $owner, $group) {

    File {
        owner => $owner,
        group => $group,
    }

    file {
        "$home_directory/.bashrc":
            ensure => present,
            content => template("g1337/shell/bashrc");
        "$home_directory/.g1337.bashrc":
            ensure => present,
            content => template("g1337/shell/g1337.bashrc");
        "$home_directory/.bin":
            ensure             => directory,
            source             => "puppet:///modules/g1337/shell/bin",
            source_permissions => use,
            recurse            => true;
    }

}
