#!python2.7
# -*- coding: utf-8 -*-

"""
使用 ansible 同步源码到多个机器
"""

import commands
import logging

import click


logging.basicConfig(level=logging.INFO)


@click.command()
@click.option('--prefix', '-p', default="~/Projects/pyzbs/", help=u'源代码路径前缀')
@click.option('--cluster', '-c', default="elf_cluster", help=u'ansible hosts 配置 /etc/ansible/hosts')
@click.option('--src', '-s', default="tuna", help=u'源代码文件夹，多个使用逗号分割')
@click.option('--dst', '-d', default="/usr/lib/python2.7/site-packages/", help=u'位于远程主机的目标路径')
@click.option('--ask-pass', '-a', is_flag=True, help=u'询问密码')
def sync(prefix, cluster, src, dst, ask_pass):

    # 拼接完整的源代码路径
    srcs = [prefix + src for src in str(src).split(',')]
    logging.info("sync cluster is: {}".format(cluster))
    logging.info("src path is: {}".format(srcs))
    logging.info("dst path is: {}".format(dst))

    # 分发 ssh key 到集群各主机
    # 首次连接需要 .ssh/known_hosts，并且首次时使用密码登录，需要 --ask-pass 选项
    # ansible elf-cluster -m authorized_key -a "user=root key='{{ lookup('file', '~/.ssh/id_rsa.pub') }}'" --ask-pass

    # ansible elf-cluster -m synchronize -a 'src=zbs_rest dest=/usr/lib/python2.7/site-packages/'
    for item in srcs:
        cmd = "ansible {cluster} -m synchronize -a 'src={item} dest={dst}'{ask}".format(
            cluster=cluster,
            item=item,
            dst=dst,
            ask=' --ask-pass' if ask_pass else ''
        )
        logging.info("run cmd: {}".format(cmd))
        output = commands.getoutput(cmd)
        logging.info(output)


if __name__ == "__main__":
    sync()
