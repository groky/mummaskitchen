function changeto(val){
	var freezer = "freezer";
	var fresh = "fresh";
	var element;
	
	if (val==1) {
		element = document.getElementById(fresh);
		element.className='round top-nav-bg';
		element = document.getElementById(freezer);
		element.className='round click-to';
	}
	else{
		element = document.getElementById(fresh);
		element.className='round top-nav-bg';
		element = document.getElementById(freezer);
		element.className='round click-to';		
	}


}