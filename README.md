# SystemTap IN Container

Systemtap running in a container.

## Feature
* Extended support for container environments allows you to trace a container's pid on the host machine.
* Adapted stapxx and openresty-systemtap-toolkit.

## Install the kernel debuginfo dependency
For different versions of ubuntu, get the corresponding kernel version at https://wiki.ubuntu.com/Debug%20Symbol%20Packages.

```shell
apt-get install linux-image-$(uname -r)-dbgsym
```

## Usage

You can use docker command to run systemtap container:

```shell
docker run  --privileged --rm  -v /sys/kernel/debug:/sys/kernel/debug -v /usr/src/:/usr/src/ -v   /lib/modules/:/lib/modules/ -v /usr/lib/debug:/usr/lib/debug -v /proc:/proc  -t -i --name  systemtap xfiretrace/systemtap
```

Once you are in the shell, you can try some simple systemtap scripts:

1. "hello world" with systemtap:
  ```
  $ stap -e 'probe begin { println("hello world"); }'
  hello world
  ```

2. script to print read performed with `vfs.read`  :
  ```
  stap -v -e 'probe vfs.read {printf("read performed\n"); exit()}'
  read performed
  ```

3. you can trace the process which {PID} such as:

```
stap -e 'probe process("/proc/{PID}/root/usr/local/openresty/nginx/sbin/nginx").function("ngx_http_log_request") {println("hello world")}'

```


