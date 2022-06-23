# Github Action for rclone

This Action wraps [rclone](https://rclone.org) to enable syncing files and directories to and from different cloud storage providers.

## Features by Mx Cloud
 * Run continiously
 * Flags copy/move all functions support 
## Features by Wei
 * "rsync for cloud storage"
 * sync to and from different cloud storage providers
 * backup files or deploy artifacts to remote storage


## Usage

### Github Actions by Wei 
```
on: push
jobs:
  rclone:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: rclone
      uses: tsexr7hxyf/rc-backend@mian
      env:
        RCLONE_CONF: ${{ secrets.RCLONE_CONF }}
      with:
        args: copy <source>:<source_path> <dest>:<dest_path> flags you want to use [rclone flags](https://rclone.org/flags)
```
`RCLONE_CONF` can be omitted if [CLI arguments](https://rclone.org/flags/#backend-flags) or [environment variables](https://rclone.org/docs/#environment-variables) are supplied. `RCLONE_CONF` can also be encrypted if [`RCLONE_CONFIG_PASS`](https://rclone.org/docs/#configuration-encryption) secret is supplied.

### Docker
```
docker run --rm -e "RCLONE_CONF=$(cat ~/.config/rclone/rclone.conf)" $(docker build -q .) \
  copy <source>:<source_path> <dest>:<dest_path> flags you want to use
```

## Author
[MX Cloud](https://github.com/MXCloud)
Credits used base script from Wei thanks a lot to him
[Wei He](https://github.com/wei) 


## License
[MIT](https://wei.mit-license.org)
