#include <stdio.h>
#include <immintrin.h>
#define TAMANHO 12  // assume-se que o tamanho é multiplo de quatro -- registradores irão armazenar 4 elementos

void mostrarOpcoes() {
    printf("--------------------------------\n");
    printf("1 - Produto Escalar Simples\n");
    printf("2 - Produto Escalar Impar\n");
    printf("3 - Multiplicacao por Escalar\n");
    printf("--------------------------------\n");
}

float produto_escalar(float *a, float *b);
short MMX_produto_escalar(short *a, short *b);


int main() {
    int escolha;
    do
    {
        float x[TAMANHO];
        float y[TAMANHO];
        short a[TAMANHO];
        short b[TAMANHO];
        float produto;
        short mmx_produto;

        for (int i = 0; i < TAMANHO; i++) {
            x[i] = i;
            y[i] = i;
            a[i] = i;
            b[i] = i;
        }
    
        mostrarOpcoes();
        scanf("%d", &escolha);
        switch (escolha)
        {
        case 1:
            produto = produto_escalar(x,y);
            printf("\nProduto Escalar por Intel Intrinsics: %f\n", produto);
            break;
        case 2:
            break;
        case 3:
            break;
        case 4:
            return 0;
            break;
        default:
            printf("\nErro na seleção! Por favor, digite novamente.\n");
            break;
        }
    
    } while (escolha != 4); 
}

float produto_escalar(float *a, float *b) {
        float array[4];
        float total;
        int i;

        __m128 numero1, numero2, numero3, numero4;
        numero4 = _mm_setzero_ps(); 
        for (i = 0; i < TAMANHO; i+=4) {
            numero1 = _mm_loadu_ps(a+i); //loads unaligned array a into num1  num1= a[3]  a[2]  a[1]  a[0]
            numero2 = _mm_loadu_ps(b+i); //loads unaligned array b into num2  num2= b[3]   b[2]   b[1]  b[0]
            numero3 = _mm_mul_ps(numero1, numero2); //performs multiplication   num3 = a[3]*b[3]  a[2]*b[2]  a[1]*b[1]  a[0]*b[0]
            numero3 = _mm_hadd_ps(numero3, numero3); //performs horizontal addition -- num3=  a[3]*b[3]+ a[2]*b[2]  a[1]*b[1]+a[0]*b[0]  a[3]*b[3]+ a[2]*b[2]  a[1]*b[1]+a[0]*b[0]

            numero4 = _mm_add_ps(numero4, numero3); //performs vertical addition
        }
        numero4 = _mm_hadd_ps(numero4, numero4);
        _mm_store_ss(&total, numero4);
        return total;
    }

    //MMX technology cannot handle single precision floats

    short MMX_produto_escalar(short *a, short *b) {
        int i;
        short resultado;
        short dados;
        __m64 numero3;
        __m64 soma;
        __m64 *ptr1;
        __m64 *ptr2;

        soma  = _mm_setzero_si64(); //sets sum to zero
        for (i = 0; i < TAMANHO; i+=4) {
            ptr1 = (__m64*)&a[i];
            ptr2 = (__m64*)&b[i];
            numero3 = _m_pmaddwd(*ptr1, *ptr2); //multiplies elements and adds lower -- __m64 and stores four elements into MMX -- registers
            soma = _m_paddw(soma, numero3);
        }
        dados = _m_to_int(soma); //converts __m64 data type to an int
        soma = _m_psrlqi(soma, 32); //shifts sum
        resultado = _m_to_int(soma);
        resultado = resultado + dados;
        _m_empty(); //clears the MMX registers and MMX state.
        return resultado;
    }