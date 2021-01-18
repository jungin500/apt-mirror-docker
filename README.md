`apt-mirror` Docker image source

# Features
- `apt-mirror` by [Stifler6996/apt-mirror](https://github.com/Stifler6996/apt-mirror)

# Usage
```
docker build . -t jungin500/apt-mirror

# Change $YOUR_MIRROR_TARGET to any location you want to mirror into.
docker run \
        -it \
        --name apt-mirror-downloader \
        -v $(pwd)/mirror.list:/etc/apt/mirror.list:ro \
        -v $YOUR_MIRROR_TARGET:/var/spool/apt-mirror:rw \
        --entrypoint apt-mirror \
        --rm \
        jungin500/apt-mirror

cd $YOUR_MIRROR_TARGET/mirror/ports.ubuntu.com/ubuntu-ports/
rm -f ls-lR.gz
ls -lR > ls-lR
gzip ls-lR
```

# Example mirror.list
- this file should be at same level of "Dockerfile".
```
############# config ##################
#
set base_path    /var/spool/apt-mirror
#
# set mirror_path  $base_path/mirror
# set skel_path    $base_path/skel
# set var_path     $base_path/var
# set cleanscript $var_path/clean.sh
# set defaultarch  <running host architecture>
# set postmirror_script $var_path/postmirror.sh
# set run_postmirror 0
set nthreads     20
set _tilde 0
#
############# end config ##############

# Begin Focal (20.04) ARM64 configuration
#deb-src [arch=arm64] http://ports.ubuntu.com/ubuntu-ports/ focal main restricted universe multiverse
#deb-src [arch=arm64] http://ports.ubuntu.com/ubuntu-ports/ focal-updates main restricted universe multiverse
#deb-src [arch=arm64] http://ports.ubuntu.com/ubuntu-ports/ focal-backports main restricted universe multiverse
#deb-src [arch=arm64] http://ports.ubuntu.com/ubuntu-ports/ focal-security main restricted universe multiverse
deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports/ focal main restricted universe multiverse
deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports/ focal-updates main restricted universe multiverse
deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports/ focal-backports main restricted universe multiverse
deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports/ focal-security main restricted universe multiverse
# End Focal (20.04) configuration
```