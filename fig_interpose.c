int strcmp(const char * s1, const char * s2)
{
	static int (*real_strcmp) (const char *, const char *) = NULL;
	int i;
	for(i=0; i<22; i++)
		asm("nop;");
	if(!real_strcmp)
		real_strcmp = dlsym(RTLD_NEXT, "strcmp");
	return real_strcmp(s1, s2);
}