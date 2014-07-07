function largefiles
  find . -ls | sort -n -k 7 | tail -n 20
end
