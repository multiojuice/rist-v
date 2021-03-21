# rist-v (Rusty risc-v OS)

## Developer instructions
```
$ rustup default nightly
$ rustup target add riscv64gc-unknown-none-elf
$ cargo install cargo-binutils
```

Have Qemu downloaded. 

Before running you need a hard drive file called hdd.dsk in the root directory. To make this file...

Linux: `fallocate fallocate -l 32M hdd.dsk`

Mac: `mkfile 32M hdd.dsk`

Windows: [Instructions](https://www.howtogeek.com/693588/how-to-install-linux/)


To kill Qemu while its running
'Ctrl + A' then 'X'

Right now it this operating system is heavily influenced (Stephen Marz)[https://osblog.stephenmarz.com/ch1.html] and (Philipp Oppermann)[https://os.phil-opp.com/].... so shoutout them. 
