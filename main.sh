rm .termux/*
unzip termuxIDE/res/dotTermux.zip -d .termux/

codeFile="basic.html"
touch $codeFile

mkdir -p .local/bin/
cp termuxIDE/res/uti .local/bin/uti
chmod u+x .local/bin/uti

mkdir -p .config/micro/
echo '{
  "Ctrl-r" : "command:run xdg-open '$codeFile'",
  "Ctrl-u" : "command:run uti",
}' > .config/micro/bindings.json

echo '{
    "softwrap": true,
}' > .config/micro/settings.json

echo 'cd
export PATH="$HOME/.local/bin:$PATH"
micro '$codeFile' 
exit' > .bashrc
