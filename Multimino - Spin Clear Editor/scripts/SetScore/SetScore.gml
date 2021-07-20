function SetScore() {
	if(PSpin)
	{
	    var Fact;
    
	    if(Mini) Fact = 100
	    if(Super)Fact = 425
	    else     Fact = 400
    
	    if(n == 0) score += Fact * level
	    else score += Fact * (n + 1) * level * BTB
	}
	else
	{
	    if(n == 1) score += 100 * level
	    if(n == 2) score += 300 * level
	    if(n == 3) score += 500 * level
	    if(n == 4) score += 800 * level * BTB
	}

	if(AC)  score += 2500 * level
	if(ComboCount > 0) score += 50 * ComboCount * level



}
