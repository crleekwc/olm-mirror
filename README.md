# olm-mirror
This container can be used to download the Operator Catalog on any operating system that can create containers.

### Usage
`podman run
 -v <host directory>:<guest directory>:z
 -e REG_CREDS=auth.json
 localhost/olm-mirror`
 
 
