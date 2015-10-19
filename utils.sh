#env bash
CWD=`pwd`

for i in $@; do
    case $i in
        --modules)
            echo "Installing modules.."
            cd Govnolia
            cpanm .
            cd $CWD 
            ;;
        --server)
            ./utils.sh --modules
            echo "Restarting server.."
            pkill plackup
            PLACK_ENV=development plackup -D --access-log=`pwd .`/access_log 2>&1
            ;;
        --db)
            ;;
    esac
done
