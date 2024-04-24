
#define size_t unsigned int
#define NULL 0
#define SIZE_MAX
#define bool unsigned char
#define false 0
#define true 1
typedef int* intptr_t;

void  *memset(void *b, int c, size_t len)
{
  unsigned char *p = b;
  while(len > 0)
    {
      *p = c;
      p++;
      len--;
    }
  return(b);
}

void memcpy(void *dest, void *src, size_t n)  
{  
// Typecast src and dest addresses to (char *)  
char *csrc = (char *)src;  
char *cdest = (char *)dest;  
  
// Copy contents of src[] to dest[]  
for (int i=0; i<n; i++)  
    cdest[i] = csrc[i];  
}  

void *malloc(size_t size);
void *calloc(size_t nmemb, size_t size);
void *realloc(void *ptr, size_t size);
void free(void *ptr);