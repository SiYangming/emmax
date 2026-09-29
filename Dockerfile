# EMMAX 0.0.20100307 (== upstream emmax-beta-07Mar2010)
# Tag must match conda version: quay.io/bioinfortools/emmax:0.0.20100307
FROM debian:bookworm-slim

LABEL org.opencontainers.image.title="emmax" \
      org.opencontainers.image.version="0.0.20100307" \
      org.opencontainers.image.description="EMMAX GWAS LMM (UMICH beta 07Mar2010)" \
      org.opencontainers.image.source="https://github.com/SiYangming/emmax"

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates libgomp1 \
    && rm -rf /var/lib/apt/lists/*

COPY upstream/emmax-beta-07Mar2010.tar.gz /tmp/emmax.tar.gz

RUN tar -xzf /tmp/emmax.tar.gz -C /tmp \
    && install -m 0755 /tmp/emmax-beta-07Mar2010/emmax /usr/local/bin/emmax \
    && install -m 0755 /tmp/emmax-beta-07Mar2010/emmax-kin /usr/local/bin/emmax-kin \
    && rm -rf /tmp/emmax.tar.gz /tmp/emmax-beta-07Mar2010 \
    && emmax-kin 2>&1 | head -5 || true

WORKDIR /data
