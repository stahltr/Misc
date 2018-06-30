///////////////////////////////////////////////////////////////
//Name: Trevor CB Stahl
//
//Date: 2 11 2018
//
//Description: removed
///////////////////////////////////////////////////////////////

//////////////////
// custom non-iterative max function to keep arrayMax cleaner
// simply compares two ints returns b if equal and a only if a is bigger
//////////////////
int max(int a, int b)
{
	if (a > b)
		return a;
	
	return b;
}

////////////////////////
// arrayMax function described initially above
/////////////////////////////
int arrayMax(int iArray[], int aSize)
{
	if (aSize == 1)
	{
		return iArray[0];
	}

	return max(iArray[aSize-1], arrayMax(iArray, aSize-1 ));

}
