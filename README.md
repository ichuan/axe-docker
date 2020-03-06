# axe-docker
Dockerfile for axe (<https://github.com/AXErunners/axe>)


# Building

```bash
docker build -t axe .
```

# Running

Customize config file `coin.conf` first.

```bash
# block dir
mkdir data
docker run --rm -itd --name axe -p 9337:9337 -v `pwd`/data:/opt/coin/data -v `pwd`/coin.conf:/opt/coin/coin.conf axe
```

# Using pre-built docker image

```bash
docker run --rm -itd --name axe -p 9337:9337 -v `pwd`/data:/opt/coin/data -v `pwd`/coin.conf:/opt/coin/coin.conf mixhq/axe
```
