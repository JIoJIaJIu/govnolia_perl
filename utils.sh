#env bash

for i in $@; do
    case $i in
        --restart)
            echo "Restarting server.."
            pkill plackup
            plackup -D --access-log=`pwd .`/access_log
            ;;
    esac
done
