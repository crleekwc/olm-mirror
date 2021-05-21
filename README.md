# olm-mirror
This container can be used to download the Operator Catalog on any operating system that can create containers.

### Usage
First: Build the image
`podman build --tag olm-mirror ./Dockerfile`

Then: Run the container
`podman run
 -v <host directory>:<guest directory>:z
 -e REG_CREDS=auth.json
 localhost/olm-mirror`
 
 
