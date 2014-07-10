function brewout
  brew update
  set_color blue
  echo '==>'
  set_color normal
  brew outdated
end
