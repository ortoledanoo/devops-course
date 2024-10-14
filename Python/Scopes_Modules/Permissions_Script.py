import os #os.listdir, os.access
import sys #sys.argv
import stat #Add Permissions

#Reviewed By Linor
print(os.listdir("/home/ortoledano"))
if sys.argv[1] in os.listdir("/home/ortoledano"):
    print("File Found")
    file_path = str("/home/ortoledano/" + sys.argv[1])
    if os.access(file_path, os.W_OK):
        print(file_path)
        print("Have Execute Permissions")
    else:
        print("File Don't Have Execute Permissions")
        os.chmod(file_path, stat.S_IXGRP | stat.S_IXUSR)
        print("Added Execute Permissions")
else:
    print("File Not Found")
