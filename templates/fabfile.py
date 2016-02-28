import yaml
from fabric.api import env, run

def import_inf(data='web_app_basic.yml'):
    inf_data = open(data, 'r')
    inf = yaml.load(inf_data)
#    for box in inf:
#        print '\n'
#        for parameter in box:
#            print parameter, ':', box[parameter]
    return inf
    inf_data.close()

inf = import_inf()
env.hosts = [inf[1]['ip']]
env.user = 'vagrant'
env.password = 'vagrant'

def hostinf():
    run('hostname')
    run('ip a sh dev eth1')
    run('uname -a')

