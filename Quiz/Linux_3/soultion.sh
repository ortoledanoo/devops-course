tail -n +99 file.txt | head -n 1
# tail -n +99 || Starts displaying the file content from the 99th line
# head -n 1 ||  Extracts only the first line of the output

chmod 1770 shared_directory

# Create Shared Directory
# 1 (Sticky Bit) Prevents users from deleting files they not owners


scp local_file dest_user@dest_ip:/path/on/dest


command < file1 > file2 2> file3

# < file1 || Redirects input to the command from file1
# > file2: Redirects stdout to file2
# 2> file3: Redirects stderr to file3
