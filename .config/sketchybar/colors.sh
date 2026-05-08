#!/usr/bin/env bash
# Monokai Pro (Filter Octagon) palette. Format: 0xAARRGGBB (alpha-first).
# Reference: https://monokai.pro/

# Base
export BG_DEEP=0xff19181a         # bar background — Monokai darker bg
export BG_PANEL=0xff2d2a2e        # bracket / popup panels — Monokai bg
export BG_HL=0xff403e41           # active item highlight — Monokai black
export BG_TRANSPARENT=0x00000000

# Accents (Monokai Pro semantic colors)
export PINK=0xffff6188            # primary — front app, active workspace (Monokai red)
export CYAN=0xff78dce8            # info — clock, wifi (Monokai cyan)
export PURPLE=0xffab9df2          # secondary (Monokai purple)
export MINT=0xffa9dc76            # ok — battery healthy, volume normal (Monokai green)
export YELLOW=0xffffd866          # warnings — mid battery, cpu high (Monokai yellow)
export CORAL=0xfffc9867           # alerts — low battery, muted (Monokai orange)

# Text
export FG=0xfffcfcfa              # primary text — Monokai foreground
export FG_DIM=0xff939293          # inactive workspace, secondary text — Monokai gray
export BORDER=0xff5b595c          # bracket borders — Monokai subtle gray
