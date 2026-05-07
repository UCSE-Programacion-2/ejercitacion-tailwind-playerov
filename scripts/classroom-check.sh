#!/usr/bin/env bash
set -u

fail() {
  echo "$1" >&2
  exit 1
}

ok() {
  echo CORRECTO
}

INDEX="index.html"
ABOUT="pages/about.html"
FAQ="pages/faq.html"
PRIVACY="pages/privacy.html"
PAGES=("$INDEX" "$ABOUT" "$FAQ" "$PRIVACY")

check_tailwind_cdn() {
  local file="$1"
  grep -qiE '<script[^>]*src=["'"'"']https://cdn\.tailwindcss\.com["'"'"']' "$file" \
    || fail "No se encontro CDN de Tailwind en $file."
}

check_no_legacy_css_link() {
  local file="$1"
  grep -qiE '<link[^>]*href=["'"'"'](\./|\.\./)?css/styles\.css["'"'"']' "$file" \
    && fail "Se detecto enlace legado a css/styles.css en $file."
}

check_has_tailwind_utility() {
  local file="$1"
  grep -qE 'class="[^"]*(flex|grid|bg-|text-|p-|m-)[^"]*"' "$file" \
    || fail "No se detectan utilidades Tailwind basicas en $file."
}

check_has_responsive_utility() {
  local file="$1"
  grep -qE 'class="[^"]*(sm:|md:|lg:)[^"]*"' "$file" \
    || fail "No se detectan utilidades responsive (sm:/md:/lg:) en $file."
}

check_footer_signature() {
  local file="$1"
  grep -qE 'Desarrollado por' "$file" \
    || fail "Falta la firma 'Desarrollado por ...' en $file."
  grep -qE 'Desarrollado por[[:space:]]+\[Nombre y Apellido\]' "$file" \
    && fail "Debes reemplazar '[Nombre y Apellido]' por datos reales en $file."
}

case "${1:-}" in
  base-structure)
    [[ -f "$INDEX" ]] || fail "Falta index.html."
    [[ -f "$ABOUT" ]] || fail "Falta pages/about.html."
    [[ -f "$FAQ" ]] || fail "Falta pages/faq.html."
    [[ -f "$PRIVACY" ]] || fail "Falta pages/privacy.html."
    [[ -d "pages" ]] || fail "Falta la carpeta pages/."
    ok
    ;;

  tailwind-cdn-all-pages)
    for f in "${PAGES[@]}"; do
      [[ -f "$f" ]] || fail "No existe $f."
      check_tailwind_cdn "$f"
    done
    ok
    ;;

  no-legacy-css-link)
    for f in "${PAGES[@]}"; do
      [[ -f "$f" ]] || fail "No existe $f."
      check_no_legacy_css_link "$f"
    done
    ok
    ;;

  index-layout-shell)
    [[ -f "$INDEX" ]] || fail "No existe index.html."
    grep -qE 'id="menu-principal"' "$INDEX" \
      || fail "No se encontro el nav con id menu-principal en index.html."
    check_has_tailwind_utility "$INDEX"
    check_has_responsive_utility "$INDEX"
    ok
    ;;

  index-services-grid)
    [[ -f "$INDEX" ]] || fail "No existe index.html."
    grep -qE 'id="servicios-grid"' "$INDEX" \
      || fail "Falta el contenedor #servicios-grid en index.html."
    grep -qE 'class="[^"]*grid[^"]*"' "$INDEX" \
      || fail "No se detecta uso de grid en index.html."
    grep -qE 'class="[^"]*hover:[^"]*"' "$INDEX" \
      || fail "No se detectan estados hover en index.html."
    ok
    ;;

  about-stats-grid)
    [[ -f "$ABOUT" ]] || fail "No existe pages/about.html."
    grep -qE 'id="stats-grid"' "$ABOUT" \
      || fail "Falta el contenedor #stats-grid en pages/about.html."
    grep -qE 'class="[^"]*grid[^"]*"' "$ABOUT" \
      || fail "No se detecta grid para stats en pages/about.html."
    check_has_responsive_utility "$ABOUT"
    ok
    ;;

  faq-list-style)
    [[ -f "$FAQ" ]] || fail "No existe pages/faq.html."
    grep -qE 'id="faq-list"' "$FAQ" \
      || fail "Falta #faq-list en pages/faq.html."
    grep -qE 'class="[^"]*(divide-y|border-b)[^"]*"' "$FAQ" \
      || fail "No se detecta separacion visual entre items en FAQ."
    grep -qE 'class="[^"]*hover:[^"]*"' "$FAQ" \
      || fail "No se detectan clases hover en pages/faq.html."
    ok
    ;;

  privacy-cards-lists)
    [[ -f "$PRIVACY" ]] || fail "No existe pages/privacy.html."
    grep -qE 'id="privacy-cards"' "$PRIVACY" \
      || fail "Falta #privacy-cards en pages/privacy.html."
    grep -qE 'class="[^"]*grid[^"]*"' "$PRIVACY" \
      || fail "No se detecta grid en pages/privacy.html."
    grep -qE 'class="[^"]*list-disc[^"]*"' "$PRIVACY" \
      || fail "No se detecta list-disc en pages/privacy.html."
    check_has_responsive_utility "$PRIVACY"
    ok
    ;;

  footer-signature)
    for f in "${PAGES[@]}"; do
      [[ -f "$f" ]] || fail "No existe $f."
      check_footer_signature "$f"
    done
    ok
    ;;

  *)
    echo "Prueba automatica no reconocida. Avisale al docente." >&2
    exit 2
    ;;
esac
