FROM alpine:3 as builder

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

RUN apk add --update --no-cache \
      git \
      make \
      cmake \
      libstdc++ \
      gcc \
      g++ \
      automake \
      libtool \
      autoconf \
      linux-headers \
      && git clone --depth=1 "https://github.com/MoneroOcean/xmrig.git" \
      && mkdir xmrig/build \
      && cd xmrig/scripts \
      && ./build_deps.sh \
      && cd ../build \
      && cmake .. -DXMRIG_DEPS=scripts/deps -DBUILD_STATIC=ON \
      && make -j "$(nproc)"

FROM alpine:3

COPY --from=builder /xmrig/build/xmrig /xmrig

ENTRYPOINT ["/xmrig"]
CMD [ "--help" ]
