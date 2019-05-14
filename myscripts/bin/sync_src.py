#!python2.7
# -*- coding: utf-8 -*-

"""
使用 ansible 同步源码到多个机器
"""

import click
import commands


@click.command()
@click.option('--prefix', default="~/Projects/pyzbs/", help='源代码路径前缀')
@click.option('--cluster', default="zouquan-cluster", help='ansible hosts 配置 /etc/ansible/hosts')
@click.option('--src', default="tuna", help='源代码文件夹')
@click.option('--dst', default="/usr/lib/python2.7/site-packages/", help='位于远程主机的目标路径')
def sync(prefix, cluster, src, dst):

    # 拼接完整的源代码路径
    srcs = [prefix + src for src in str(src).split(',')]
    print "sync cluster is:", cluster
    print "src path is:", srcs
    print "dst path is:", dst

    # 分发 ssh key 到集群各主机
    # 首次连接需要 .ssh/known_hosts，并且首次时使用密码登录，需要 --ask-pass 选项
    # ansible zouquan-cluster -m authorized_key -a "user=root key='{{ lookup('file', '~/.ssh/id_rsa.pub') }}'" --ask-pass

    # ansible zouquan-cluster -m synchronize -a 'src=zbs_rest dest=/usr/lib/python2.7/site-packages/'
    for src in srcs:
        print commands.getoutput(
            "ansible {cluster} -m synchronize -a 'src={src} dest={dst}'".format(
                cluster=cluster,
                src=src,
                dst=dst
            )
        )


if __name__ == "__main__":
    sync()

