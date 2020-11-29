state("FalloutNV")
{
    bool loading : 0xDDA4EC;
    bool introDone : 0xDDA590;
}

update
{

    int crash = 0;
    Process[] processlist = Process.GetProcesses();
    foreach (Process theprocess in processlist)
    {
		if (theprocess.ProcessName == "FalloutNV")
		{
			crash += 1;
            if(crash>=2)
            {
                foreach (Process nv in processlist)
                {
                    if (nv.ProcessName == "FalloutNV")
                    {
                        nv.Kill();
                    }
                }
             }
        }
	
	}
	
    vars.isLoading = false;
    if ((current.loading) || (!current.introDone)) {
        vars.isLoading = true;
    }
}

exit
{
    timer.IsGameTimePaused = true;
}

isLoading
{
    return vars.isLoading;
}


