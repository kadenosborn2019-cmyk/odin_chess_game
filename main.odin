package main

import rl "vendor:raylib"


main :: proc() {
	// variable asignment before main loop
	x_array := [8]int{0, 1, 2, 3, 4, 5, 6, 7}
	y_array := [8]int{0, 1, 2, 3, 4, 5, 6, 7}
	window_width: f32 = 1920
	window_height: f32 = 1080
	board_size :: 8
	square_size: f32 = (window_height) / (board_size)
	color_dark := rl.DARKGREEN
	color_light := rl.LIGHTGRAY

	// raylib setup window size and defer memory
	rl.InitWindow(i32(window_width), i32(window_height), "Chess Game")
	defer rl.CloseWindow()

	rl.SetTargetFPS(120)

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		rl.ClearBackground(rl.DARKGRAY)
		// draws the chess board 8x8
		for row := 0; row < board_size; row += 1 {
			for col := 0; col < board_size; col += 1 {
				is_dark := (row + col) % 2 == 0
				square_color := is_dark ? color_dark : color_light

				x := (f32(col) * square_size) + 420
				y := f32(row) * square_size

				rl.DrawRectangleRec(rl.Rectangle{x, y, square_size, square_size}, square_color)
			}
		}
		rl.EndDrawing()
	}

	rl.CloseWindow()
}
