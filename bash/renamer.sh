IFS='.'
if [[ -d $1 ]]; then
  cd "$1"
  if [[ "$2" == "-c" || "$2" == "--copy" ]]; then
    for file in *
    do
      if [[ -f $file ]]; then
        TIME=$(date +%F)
        cp "$file" "${TIME}_${file}" 
        read -a stringArray <<< "$file"
        echo "name: $file type: ${stringArray[1]}   -> making copy: ${TIME}_${file}"
      fi
    done
  elif [ -z ${2+x} ]; then
    for file in *
    do
      if [[ -f $file ]]; then
        TIME=$(date +%F)
        mv "$file" "${TIME}_${file}"
        read -a stringArray <<< "$file"
        echo "name: $file type: ${stringArray[1]}   -> changing name to: ${TIME}_${file}"
      fi
    done
  fi
else
  echo "Directory is not valid"
fi

