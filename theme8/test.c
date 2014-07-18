int l(int x, int y, int z)
{
    return x+y+z;
}

int r(int x)
{
    return x + l(1, 2, 3);
}


int rsl2()
{
    return l(1,2,3) - r(4);
}

