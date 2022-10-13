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

float produto_escalar_normal(float *a, float *b);
float produto_escalar_impar(float *a, float *b, float *z);
void multiplo_por_escalar(float *x, float *y, float multiplo);

int main() {
    int escolha;
    do
    {
        float x[TAMANHO];
        float y[TAMANHO];
        float z[TAMANHO];
        float produto;
        float mult;

        for (int i = 0; i < TAMANHO; i++) {
            x[i] = i;
            y[i] = i;
            z[i] = i;
        }
    
        mostrarOpcoes();
        scanf("%d", &escolha);
        switch (escolha)
        {
        case 1:
            produto = produto_escalar_normal(x,y);
            printf("\nProduto escalar na forma tradicional: %f\n", produto);
            break;
        case 2:
            produto = produto_escalar_impar(x,y,z); 
            printf("\nProduto escalar na forma tradicional: %f\n", produto); 
            break;
        case 3:
            printf("\nDigite o multiplicador:");
            scanf("%f", &mult);
            multiplo_por_escalar(x,y,mult);
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

float produto_escalar_normal(float *a, float *b) {
    float escalar = 0;
    for (int i = 0; i < TAMANHO; i++) {
        escalar += a[i]*b[i]; 
    }
    return escalar;
}

float produto_escalar_impar(float *a, float *b, float *c) {
    float escalar = 0;
    for (int i = 0; i < TAMANHO; i++) {
        escalar += a[i]*b[i]*c[i]; 
    }
    return escalar;
}

void multiplo_por_escalar(float *x, float *y, float multiplo) {
    for(int i = 0; i < TAMANHO; i++) {
        printf("\n x antes da multiplicacao %f na posicao:  %d", x[i], i);
        printf("\n y antes da multiplicacao %f na posicao:  %d", y[i], i);
        x[i] = x[i]*multiplo;
        y[i] = y[i]*multiplo;
        printf("\n x depois da multiplicacao %f na posicao:  %d", x[i], i);
        printf("\n y depois da multiplicacao %f na posicao:  %d", y[i], i);
    }
}