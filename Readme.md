# rist-v (Rusty risc-v OS)

## Developer instructions
```
$ rustup default nightly
$ rustup target add riscv64gc-unknown-none-elf
$ cargo install cargo-binutils
```

Have Qemu downloaded. 

Right now it this operating system is heavily influenced (Stephen Marz)[https://osblog.stephenmarz.com/ch1.html] and (Philipp Oppermann)[https://os.phil-opp.com/].... so shoutout them. 