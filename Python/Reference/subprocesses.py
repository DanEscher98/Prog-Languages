#!/usr/bin/python3
import subprocess

def ping(servers):
    outputlist = []
    for server in servers:
        temp = subprocess.Popen(['ping', '-c 1', server], stdout = subprocess.PIPE)
        output = temp.communicate()
        outputlist.append(output)
    return outputlist

if __name__=='__main__':
    servers = list(open('servers.txt'))
    for i in range(len(servers)):
        servers[i] = servers[i].strip('\n')
        
    for i in ping(servers):
        print(i[0].decode('UTF-8'))
