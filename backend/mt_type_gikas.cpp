unsigned short handle;
short ret;
ret = cnc_startupprocess(0, "test.log");
ret = cnc_allclibhndl3(ip_maq, 8193, 10, &handle);

ODBSYS sysinfo;	// Chamando variável pointer, que armazena os dados do CNC
cnc_sysinfo(handle,&sysinfo);

//Retorna tipo de CNC da máquina
char cnc_type[5];
getCNCtype(sysinfo.cnc_type[0],sysinfo.cnc_type[1],cnc_type);

//Essa função transforma o retorno em uma string só
char* getCNCtype(char sysinfo0, char sysinfo1, char cnc_ret[])
{

	// Para cada retorno possível da função, foi criado um caso
	if (sysinfo0=='1' && sysinfo1=='5')
	{
		strcpy(cnc_ret,"15");
	}
	else if (sysinfo0=='1' && sysinfo1=='6')
	{
		strcpy(cnc_ret,"16");
	}
	else if (sysinfo0=='1' && sysinfo1=='8')
	{
		strcpy(cnc_ret,"18");
	}
	else if (sysinfo0=='2' && sysinfo1=='1')
	{
		strcpy(cnc_ret,"21");
	}
	else if (sysinfo0=='3' && sysinfo1=='0')
	{
		strcpy(cnc_ret,"30");
	}
	else if (sysinfo0=='3' && sysinfo1=='1')
	{
		strcpy(cnc_ret,"31");
	}
	else if (sysinfo0=='3' && sysinfo1=='2')
	{
		strcpy(cnc_ret,"32");
	}
	else if (sysinfo0=='3' && sysinfo1=='5')
	{
		strcpy(cnc_ret,"35");
	}
	else if (sysinfo0=='0')
	{
		strcpy(cnc_ret,"0");
	}
	else if (sysinfo0=='P' && sysinfo1=='D')
	{
		strcpy(cnc_ret,"PD");
	}
	else if (sysinfo0=='P' && sysinfo1=='H')
	{
		strcpy(cnc_ret,"PH");
	}
	else if (sysinfo0=='P' && sysinfo1=='M')
	{
		strcpy(cnc_ret,"PM");
	}
	else
	{
		strcpy(cnc_ret,"Unrecognized");
	}

	return cnc_ret;
}

//Retorna tipo de MT da máquina
char mt_type[5];
getMTtype(sysinfo.mt_type[1],sysinfo.mt_type[1],mt_type);

//Essa função transforma o retorno em uma string só
char* getMTtype(char sysinfo0, char sysinfo1, char mt_ret[])
{

	// Para cada retorno possível da função, foi criado um caso
	if (sysinfo0=='M' && sysinfo1=='M')
	{
		strcpy(mt_ret,"MM");
	}
	else if (sysinfo0=='M' && sysinfo1=='T')
	{
		strcpy(mt_ret,"MT");
	}
	else if (sysinfo0=='M' && sysinfo1=='G')
	{
		strcpy(mt_ret,"MG");
	}
	else if (sysinfo0=='M')
	{
		strcpy(mt_ret,"M");
	}
	else if (sysinfo0=='T' && sysinfo1=='T')
	{
		strcpy(mt_ret,"TT");
	}
	else if (sysinfo0=='T')
	{
		strcpy(mt_ret,"T");
	}
	else if (sysinfo0=='P')
	{
		strcpy(mt_ret,"P");
	}
	else if (sysinfo0=='L')
	{
		strcpy(mt_ret,"L");
	}
	else if (sysinfo0=='W')
	{
		strcpy(mt_ret,"W");
	}
	else
	{
		strcpy(mt_ret,"Unrecognized");
	}

	return mt_ret;
}
