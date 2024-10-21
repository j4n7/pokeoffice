AnimateTapeTileL:
	; Change to VRAM bank 1
	; ld a, 1
	; ld [rVBK], a

    ; push de

    ; ld de, EVENT_ANIM_TAPE
    ; ld b, CHECK_FLAG
    ; call EventFlagAction

    ; pop de

    ; ld a, c
    ; and a ; is it 0?
    ; jp z, StopTapeL ; yes, then jump to something else
    ; ; otherwise, run code for 1

	ld hl, sp + 0
	ld b, h
	ld c, l

	; period 8, offset to 1 tile (16 bytes)
	ld a, [wTileAnimationTimer]
	maskbits 8 ; n frames per row
	swap a

	ld hl, TapeTileFrames
	add a, l
	ld l, a
	adc a, h
	sub l
	ld h, a

	ld sp, hl
	jmp WriteTileToDE

StopTapeL:
	ld hl, sp + 0
	ld b, h
	ld c, l

	ld a, 0
	maskbits 8 ; n frames per row
	swap a

	ld hl, TapeTileFrames
	add a, l
	ld l, a
	adc a, h
	sub l
	ld h, a

	ld sp, hl
	jmp WriteTileToDE

AnimateTapeTileR:
    ; Change to VRAM bank 1
    ; ld a, 1
    ; ld [rVBK], a

    ; push de

    ; ld de, EVENT_ANIM_TAPE
    ; ld b, CHECK_FLAG
    ; call EventFlagAction

    ; pop de

    ; ld a, c
    ; and a ; is it 0?
    ; jp z, StopTapeR ; yes, then jump to something else
    ; ; otherwise, run code for 1

    ld hl, sp + 0
    ld b, h
    ld c, l

    ; period 8, offset to 1 tile (16 bytes)
    ld a, [wTileAnimationTimer]
    maskbits 8 ; n frames per row
    swap a

    ld hl, TapeTileFrames + (16 * 8)  ; Offset of 16 bytes x n frames per row
    add a, l
    ld l, a
    adc a, h
    sub l
    ld h, a

    ld sp, hl
    jmp WriteTileToDE

StopTapeR:
	ld hl, sp + 0
	ld b, h
	ld c, l

	ld a, 0
	maskbits 8 ; n frames per row
	swap a

	ld hl, TapeTileFrames + (16 * 8)
	add a, l
	ld l, a
	adc a, h
	sub l
	ld h, a

	ld sp, hl
	jmp WriteTileToDE

TapeTileFrames:
INCBIN "gfx/tilesets/anims/tape.2bpp"

AnimateScreenTileL:
	ld hl, sp + 0
	ld b, h
	ld c, l

	; period 8, offset to 1 tile (16 bytes)
	ld a, [wTileAnimationTimer]
	maskbits 4
	swap a

	ld hl, .ScreenTileFrames
	add a, l
	ld l, a
	adc a, h
	sub l
	ld h, a

	ld sp, hl
	jmp WriteTileToDE

.ScreenTileFrames:
INCBIN "gfx/tilesets/anims/screen.2bpp"

AnimateScreenTileR:
    ld hl, sp + 0
    ld b, h
    ld c, l

    ; period 8, offset to 1 tile (16 bytes)
    ld a, [wTileAnimationTimer]
    maskbits 4
    swap a

    ld hl, .ScreenTileFrames + (16 * 4)
    add a, l
    ld l, a
    adc a, h
    sub l
    ld h, a

    ld sp, hl
    jmp WriteTileToDE

.ScreenTileFrames:
INCBIN "gfx/tilesets/anims/screen.2bpp"
