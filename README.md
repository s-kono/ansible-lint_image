* https://pypi.org/project/ansible/
* https://pypi.org/project/ansible-lint/
* https://hub.docker.com/_/python

```sh
$ version=$( grep ^ansible-lint ./requirements.txt | awk -F= '{print $NF}' )
$ proxy= ; https_proxy=${proxy} docker build \
  --build-arg http_proxy=${proxy} --build-arg https_proxy=${proxy} \
  -t ansible-lint:${version} .
$ cd ./${WORK_DIR}/
$ docker run --rm -v ${PWD}:/work ansible-lint:${version} ./lint-target.yml
```
