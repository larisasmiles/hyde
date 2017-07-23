class Hyde
  function newsite() {
  mkcd "$*"  # mkdir and cd into it
  mkdir "js"
  mkdir "imgs"
  cat > index.html <<'EOI'
<html>
<head>
</head>
<body>
</body>
</html>
EOI
  cat > main.css <<'EOI'
body {
 font-family: Arial;
}
EOI
  vim "index.html"
}
end
