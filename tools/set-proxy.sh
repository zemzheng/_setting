# 用来为 git
# proxy="http://server:port"
ssh-keygen

echo "Input proxy(exp): <http://server:port>"
read proxy

if [ ! proxy ] ; then
    exit
fi

if [ ! -d /c/Program\ Files\ (x86)/Git/bin/connect.exe ] ; then
    echo "## Outside of the firewall, with HTTP proxy"                                   >> ~/.ssh/config
    echo "ProxyCommand \"C:\Program Files (x86)\Git\bin\connect.exe\" -H ${proxy} %h %p" >> ~/.ssh/config
    echo "protocol 2"                                                                    >> ~/.ssh/config
    echo "serverAliveInterval 60"                                                        >> ~/.ssh/config
else
    if [ ! -d /c/Program\ Files/Git/bin/connect.exe ] ; then
        echo "## Outside of the firewall, with HTTP proxy"                                   >> ~/.ssh/config
        echo "ProxyCommand \"C:\Program Files (x86)\Git\bin\connect.exe\" -H ${proxy} %h %p" >> ~/.ssh/config
        echo "protocol 2"                                                                    >> ~/.ssh/config
        echo "serverAliveInterval 60"                                                        >> ~/.ssh/config
    fi
fi

git config --global http.proxy $proxy
git config --global https.proxy $proxy

npm config set proxy "$proxy"
npm config set https-proxy "$proxy"

