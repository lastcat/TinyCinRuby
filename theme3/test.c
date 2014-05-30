int fact(int x)
{
	int z;
	while (x >= 1) {
		z = z*x;
		x = x-1;
	}
	return z;
}
