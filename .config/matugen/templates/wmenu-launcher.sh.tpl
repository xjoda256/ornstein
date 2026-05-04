#!/bin/bash
# wmenu-launcer
#
BG_NORMAL="{{ colors.surface.default.hex }}"      # colors.surface.default.hex
FG_NORMAL="{{ colors.on_surface.default.hex }}"      # colors.on_surface.default.hex
BG_SELECTED="{{ colors.primary.default.hex }}"    # colors.primary.default.hex
FG_SELECTED="{{ colors.on_primary.default.hex }}"    # colors.on_primary.default.hex

wmenu-run \
	-N "$BG_NORMAL" \
	-n "$FG_NORMAL" \
	-M "$BG_NORMAL" \
	-m "$FG_NORMAL" \
	-S "$BG_SELECTED" \
	-s "$FG_SELECTED" \
	-p " " \
	-f "FiraCode Nerd Font Mono 16" \
	"$@"
