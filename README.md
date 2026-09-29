# EMMAX packaging (backup + redistribution)

Backup and packaging of **EMMAX** (efficient mixed-model association eXpedited) for conda and Docker.

| Field | Value |
|-------|-------|
| Package version | `0.0.20100307` |
| Upstream release | `emmax-beta-07Mar2010` |
| Upstream download | http://csg.sph.umich.edu/kang/emmax/download/emmax-beta-07Mar2010.tar.gz |
| Conda | `YangmingSi::emmax=0.0.20100307` |
| Docker | `quay.io/bioinfortools/emmax:0.0.20100307` |

**Version rule:** conda package version and Docker image tag are the **same string** (`0.0.20100307`).

## Contents

- `upstream/emmax-beta-07Mar2010.tar.gz` — official UMICH binary tarball
- `upstream/SHA256SUMS` — checksum
- `recipe/` — conda-build / rattler-build recipe
- `Dockerfile` — container image (installs `emmax` and `emmax-kin` to `/usr/local/bin`)

## License / attribution

Upstream binaries are copyright Hyun Min Kang (see `upstream` README inside the tarball). Redistributed **AS IS** for reproducible scientific workflows. Cite:

> Kang HM, et al. (2010) Variance component model to account for sample structure in genome-wide association studies. *Nat Genet* 42:348–54.

## Notes

- Binaries are Linux x86_64 ELF; images/packages target `linux-64`.
- Invoking `emmax` with no arguments may segfault; this is upstream behaviour. Use `-t` / `-p` / `-k` / `-o` as documented upstream.

## Build (maintainers)

```bash
conda activate conda_build

# Docker (linux/amd64)
docker build --platform linux/amd64 -t quay.io/bioinfortools/emmax:0.0.20100307 .
docker push quay.io/bioinfortools/emmax:0.0.20100307

# Conda (linux-64 binary package)
rattler-build build -r recipe --target-platform linux-64
anaconda upload --user YangmingSi output/linux-64/emmax-*.conda
```
