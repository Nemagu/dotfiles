function claude
    set -lx HTTP_PROXY http://127.0.0.1:12334
    set -lx HTTPS_PROXY http://127.0.0.1:12334
    set -lx ALL_PROXY socks://127.0.0.1:12334
    set -lx NO_PROXY localhost,127.0.0.0/8,::1
    set -lx http_proxy http://127.0.0.1:12334
    set -lx https_proxy http://127.0.0.1:12334
    set -lx all_proxy socks://127.0.0.1:12334
    set -lx no_proxy localhost,127.0.0.0/8,::1
    command claude $argv
end
