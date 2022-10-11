To run this program you need to install Ubuntu Linux(Tuffix) or use Linux as the OS. https://github.com/kevinwortman/tuffix/blob/master/install.md

The next step is to install Flex by typing in these commands in the terminal in this order:
sudo apt-get update
sudo apt-get install flex

After installing flex, run these commands to run the program in this order:
lex sample.l
gcc lex.yy.c
./a.out

Note: Make sure you are in the right directory for this file to run. Use the cd command to change directory to find the folder of the file.
