#include <iostream>
#include <fstream>

using namespace std;
int*  str2int(string str);
int find(string str1, string str2)
{
    for(int i=0; str1[i]; i++)
    {
        for(int j=0; str2[j]; j++)
        {
            if(str1[i+j] != str2[j])
                break;
            else if(str2[j+1] == '\0')
                return i;
        }
    }
    return -1;
}


int*  str2int(string str);

extern "C" {
	
	int find(int *str1, int *str2);
}

int main(int argc, char * argv[])
{
	//char değişkenleri boyutlandırma işlemi
	char *ptr1 = new char[25];
	char *ptr2 = new char[5];

	//giriş dosyasını
	ifstream inputfile(argv[1], ifstream::in);

	if (!inputfile.is_open()) return -1;

	//dosyadan satır okuma
	inputfile.getline(ptr1, 25);
	inputfile.getline(ptr2, 5);

	inputfile.close();

	cout << "ptr1 : " << ptr1 << endl
		<< "ptr2 : " << ptr2 << endl;


	cout << find(str2int(ptr1), str2int(ptr2)) << endl;



	return 0;
}


int*  str2int(string str)
{
	int* A = new int[str.length()];
	int i = 0;

	while (str[i])
	{
		*(A + i) = (int)str[i]; 
		i++;
	}

	*(A + i) = 0;

	return A;
}
