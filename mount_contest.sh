umount -f contest
rmdir contest
mkdir contest
sshfs dev:/home/olegts/contests/contest$1 contest
