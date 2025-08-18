if (Flash > 1 && HP/HP_Max <= 0.35)
{
	shader_set(RedShader);
	draw_self();
	shader_reset();
}
else if(Flash > 2)
{
	shader_set(WhShader);
	draw_self();
	shader_reset();
}
else
{
	draw_self();
}
if (Flash > 0)
{
	Flash--;
}