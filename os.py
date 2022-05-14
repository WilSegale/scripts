from sys import platform
import os
if platform == "linux" or platform == "linux2":
    os.system('bash hydra.sh')
elif platform == "darwin":
    os.system('bash hydra.sh')

