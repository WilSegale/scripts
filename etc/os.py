from sys import platform
import os
if platform == "linux" or platform == "linux2":
    os.system('sudo rm -rf hydra.sh')
    os.system('bash hydra2.sh')
elif platform == "darwin":
    os.system('sudo rm -rf hydra2.sh')
    os.system('bash hydra.sh')

