#include <stdio.h>
#include <immintrin.h>

void mostrarOpcoes() {
    printf("--------------------------------\n");
    printf("1 - Produto Escalar Simples\n");
    printf("2 - Produto Escalar Impar\n");
    printf("3 - Multiplicacao por Escalar\n");
    printf("--------------------------------\n");
}

void produtoEscalarSimples() {
    double a, b;
    a = _mm_dp_ps(__m128 __X, __m128 __Y, 5 __M);
    b = _mm_dp_pd(__m128d __X, __m128d __Y, 4 __M);
}