import os
import sys

with os.popen("git rev-list HEAD", "r") as out:
	version = out.read().split("\n")[0].strip("\r")