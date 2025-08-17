draw_text(10, 40, Points);

for (var i = 0, j = 0; i < Lives; i++) {
	draw_sprite(Live_Sprite, 0, 20 + j, 20);
	j += 30;
}

if Lives < 0{
	draw_text_transformed(100, 150, "GAME OVER", 4, 4, 0);
}