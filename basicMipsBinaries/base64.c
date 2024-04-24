
//#include "stdlib.h"
//#include "liballoc.h"
#include <stdlib.h>
#define TEST_MAIN

static const unsigned char base64_table[65] =
	"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

unsigned char * base64_encode(const unsigned char *src, size_t len,
			      size_t *out_len)
{
	unsigned char *out, *pos;
	const unsigned char *end, *in;
	size_t olen;
	int line_len;
	olen = len * 4 / 3 + 4; /* 3-byte blocks to 4-byte */
	olen += olen / 72; /* line feeds */
	olen++; /* nul termination */
	out = malloc(olen);
	if (out == NULL)
		return NULL;
	end = src + len;
	in = src;
	pos = out;
	line_len = 0;
	while (end - in >= 3) {
		*pos++ = base64_table[in[0] >> 2];
		*pos++ = base64_table[((in[0] & 0x03) << 4) | (in[1] >> 4)];
		*pos++ = base64_table[((in[1] & 0x0f) << 2) | (in[2] >> 6)];
		*pos++ = base64_table[in[2] & 0x3f];
		in += 3;
		line_len += 4;
		if (line_len >= 72) {
			*pos++ = '\n';
			line_len = 0;
		}
	}
	if (end - in) {
		*pos++ = base64_table[in[0] >> 2];
		if (end - in == 1) {
			*pos++ = base64_table[(in[0] & 0x03) << 4];
			*pos++ = '=';
		} else {
			*pos++ = base64_table[((in[0] & 0x03) << 4) |
					      (in[1] >> 4)];
			*pos++ = base64_table[(in[1] & 0x0f) << 2];
		}
		*pos++ = '=';
		line_len += 4;
	}
	if (line_len)
		*pos++ = '\n';
	*pos = '\0';
	if (out_len)
		*out_len = pos - out;
	return out;
}

unsigned char * base64_decode(const unsigned char *src, size_t len,
			      size_t *out_len)
{
	unsigned char dtable[256], *out, *pos, in[4], block[4], tmp;
	size_t i, count, olen;
	memset(dtable, 0x80, 256);
	for (i = 0; i < sizeof(base64_table) - 1; i++)
		dtable[base64_table[i]] = (unsigned char) i;
	dtable['='] = 0;
	count = 0;
	for (i = 0; i < len; i++) {
		if (dtable[src[i]] != 0x80)
			count++;
	}
	if (count == 0 || count % 4)
		return NULL;
	olen = count / 4 * 3;
	pos = out = malloc(olen);
	if (out == NULL)
		return NULL;
	count = 0;
	for (i = 0; i < len; i++) {
		tmp = dtable[src[i]];
		if (tmp == 0x80)
			continue;
		in[count] = src[i];
		block[count] = tmp;
		count++;
		if (count == 4) {
			*pos++ = (block[0] << 2) | (block[1] >> 4);
			*pos++ = (block[1] << 4) | (block[2] >> 2);
			*pos++ = (block[2] << 6) | block[3];
			count = 0;
		}
	}
	if (pos > out) {
		if (in[2] == '=')
			pos -= 2;
		else if (in[3] == '=')
			pos--;
	}
	*out_len = pos - out;
	return out;
}

#ifdef TEST_MAIN
#include <stdio.h>
int main(int argc, char *argv[])
{
	FILE *f;
	size_t len, elen;
	unsigned char *buf, *e;
	if (argc != 4) {
		printf("Usage: base64 <encode|decode> <in file> <out file>\n");
		return -1;
	}
	buf = os_readfile(argv[2], &len);
	if (buf == NULL)
		return -1;
	if (strcmp(argv[1], "encode") == 0)
		e = base64_encode(buf, len, &elen);
	else
		e = base64_decode(buf, len, &elen);
	if (e == NULL)
		return -2;
	f = fopen(argv[3], "w");
	if (f == NULL)
		return -3;
	fwrite(e, 1, elen, f);
	fclose(f);
	free(e);
	return 0;
}
#endif /* TEST_MAIN */