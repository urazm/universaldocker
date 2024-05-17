FROM quay.io/school21/alpine:3.16

RUN apk update && apk upgrade

# Установка пакетов с помощью apk
RUN apk add --no-cache \
    neofetch \
    zsh \
    curl

RUN apk --no-cache --upgrade add \
    git \
    git-lfs \
    curl \
    jq \
    bash \
    build-base \
    python3 \
    valgrind \
    cppcheck \
    alpine-sdk \
    pcre-dev \
    clang-extra-tools \
    check check-dev


# Установка Powerlevel10k
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
&& apk add zsh zsh-theme-powerlevel10k \
&& mkdir -p ~/.local/share/zsh/plugins \
&& ln -s /usr/share/zsh/plugins/powerlevel10k ~/.local/share/zsh/plugins/

COPY . /project
WORKDIR /project/src

RUN make test

CMD valgrind --tool=memcheck" --leak-check=full ./test
