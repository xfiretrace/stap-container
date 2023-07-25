# Stpaxx IN Container

Stpaxx running in a container.

## Feature
* Extended support for container environments allows you to trace a container's pid on the host machine.
* Adapted stapxx with `openresty/1.19.3.2`.

## Usage

You can use docker command to run systemtap container:

```shell
docker run  --privileged --rm  -v /sys/kernel/debug:/sys/kernel/debug -v /usr/src/:/usr/src/ -v   /lib/modules/:/lib/modules/ -v /usr/lib/debug:/usr/lib/debug -v /proc:/proc  -t -i --name  systemtap xfiretrace/stapxx
```

Once you are in the shell, you can try some simple systemtap scripts:

1. "hello world" with systemtap:
  ```
  $ stap++ -e 'probe begin { println("hello") exit() }'
  hello world
  ```

2. you can trace the process which {PID} such as:  :
  ```
  cd /stapxx  
  stap++ -I ./tapset -x {PID} --arg limit=10 samples/ngx-upstream-post-conn.sxx
  ```

