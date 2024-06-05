gistUrl="https://gist.github.com/01f8aab9c679205acc0c37bbfbd7c71a.git"
destPath="src/store/setup"
fileName="state-manager-global.ts"

tempDir=$(mktemp -d -t react-bunker-state-manager-global)
if ! git clone "$gistUrl" "$tempDir"; then
  exit 1
fi

if [ ! -f "$destPath" ]; then
  mkdir -p "$destPath"
fi

if [ -f "$destPath/$fileName" ]; then
  echo "O arquivo $fileName já existe na pasta!"
  suffix=$(date +%s)
  tempFileName="state-manager-global-$suffix.ts"

  mv "$tempDir/$fileName" "$tempDir/$tempFileName"
  cp "$tempDir/$tempFileName" "$destPath/$tempFileName"

  rm -rf "$tempDir"

  echo "Seu state manager global foi adicionado em $destPath/$tempFileName"
else
  echo "Copiando $fileName para $destPath"
  
  cp "$tempDir/$fileName" "$destPath/$fileName"
  rm -rf "$tempDir"

  echo "Seu state manager global foi adicionado em $destPath/$fileName"
fi

