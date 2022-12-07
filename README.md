# Alpine with socat and pause container

This is a simple container that can be used to keep a container alive. It is based on Alpine Linux and contains socat.

## Usage

The primary use case for this container is to support `port-forwarding` for Nomad - which is a missing feature in Nomad. For more information, please look at [nomad-port-forwarding]("nomad-port-forwarding/README.md").

## The post

https://saboteurkid.medium.com/port-forwarding-the-nomads-missing-feature-7f5ab3a7cfae
