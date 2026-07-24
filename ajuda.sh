#!/bin/sh

CORPO=$(cat <<EOF

CTRL + ALT + C > <b>CALCULADORA</b>

CTRL + ALT + E > <b>EMACS</b>

CTRL + ALT + F > <b>FIREFOX</b>

<b>CTRL + ALT + G ></b>

	A > <b>GOOGLE AGENDA</b>

	G > <b>GMAIL</b>

	M > <b>MINISTER</b>

	N > <b>NOTAS PESSOAIS</b>

	W > <b>WHATSAPP</b>

	C > <b>CONFIGURAR SXHKD</b>

	R > <b>RECARREGAR SXHKD</b>

CTRL + ALT + N > <b>NEGÓCIOS</b>

CTRL + ALT + P > <b>PASTA PESSOAL</b>

CTRL + ALT + S > <b>SERVIDOR REMOTO</b>

CTRL + ALT + T > <b>TERMINAL</b>

CTRL + ALT + Y > <b>EMACS EVERYWHERE</b>


󰌌 
EOF
)

notify-send -t 3000 "󰌌    ALT + F1 > ATALHOS DE TECLADO" "$CORPO"

