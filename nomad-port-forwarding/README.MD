# How to

1. Start the nomad server and client.

Linux:

```shell
nomad agent -dev -network-interface eth0
```

MacOS:

```shell
nomad agent -dev -network-interface en0
```

2. Run the nomad job

```shell
nomad run nginx.nomad
```

3. Run the port-forwarding job

```shell
go run main.go -p 38080:http demo
```

Where `demo` is the name of the nomad job.

4. Open the browser and navigate to `http://localhost:38080`

## Limitations

- Only works with TCP based services
- This code assume you are running job with single group.
- You must edit the job file to have `socat-pause` sidecar container.

## Notes

- When running nomad in `dev` mode, you must have `-network-interface <your NIC>` or else the `NOMAD_ADDR_<port_name>` will always be `127.0.0.1` and you will not be able to access the service from outside the container. A solution is to set `network#mode = "bridge"` in the job file, but this will only work for Linux machine.

## References

- This implementation is mostly based on [this](https://github.com/hashicorp/nomad/issues/6925#issuecomment-816987443).
